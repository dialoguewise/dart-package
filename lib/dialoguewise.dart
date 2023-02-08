import 'dart:convert';
import 'dart:io';

import 'package:dialogue_wise/DTOs/add_contents_request.dart';
import 'package:dialogue_wise/DTOs/delete_content_request.dart';
import 'package:dialogue_wise/DTOs/dialoguewise_response.dart';
import 'package:dialogue_wise/DTOs/get_contents_request.dart';
import 'package:dialogue_wise/DTOs/get_variables_request.dart';
import 'package:dialogue_wise/DTOs/search_contents_request.dart';
import 'package:dialogue_wise/DTOs/update_content_request.dart';
import 'package:dialogue_wise/DTOs/upload_media_request.dart';
import 'package:dialogue_wise/constants/endpoints.dart';
import 'package:http/http.dart' as http;

///Allows you to manage your content using Dialoguewise Headless CMS
class DialoguewiseService {
  String _apiBaseUrl = '';
  final String accessToken;

  DialoguewiseService({
    String? apiBaseUrl,
    required this.accessToken,
  }) : assert(accessToken.isNotEmpty, "Please provide the access token.") {
    if (apiBaseUrl != null && apiBaseUrl.isNotEmpty) {
      _apiBaseUrl = (apiBaseUrl[apiBaseUrl.length - 1] != '/'
              ? (apiBaseUrl + "/")
              : apiBaseUrl) +
          "api/";
    } else {
      _apiBaseUrl = '';
    }
  }

  String get apiBaseUrl {
    if (_apiBaseUrl.isEmpty) {
      return 'https://api.dialoguewise.com/api/';
    }

    return _apiBaseUrl;
  }

  ///Gets all the published Dialogues in a project.
  ///Takes parameter [accessToken] of type String as access token.
  Future<DialoguewiseResponse> getDialogues() async {
    http.Request clientRequest =
        _getHeader(accessToken, Endpoints.getDialogues, isGet: true);

    return _getResponse(clientRequest);
  }

  ///Gets all the Variables of a published Dialogue.
  ///Takes parameter [request] of type GetVariablesRequest.
  Future<DialoguewiseResponse> getVariables(GetVariablesRequest request) async {
    if (request.slug.isEmpty) {
      throw FormatException("Please provide the Slug.");
    }

    http.Request clientRequest = _getHeader(
        accessToken, '${Endpoints.getVariables}?slug=${request.slug}',
        isGet: true);

    return _getResponse(clientRequest);
  }

  ///Gets all the contents in a dialogue.
  ///Takes parameter [request] of type GetContentsRequest.
  Future<DialoguewiseResponse> getContents(GetContentsRequest request) async {
    if (request.slug.isEmpty) {
      throw FormatException("Please provide a Slug.");
    } else if ((request.pageSize == null && request.pageIndex != null) ||
        (request.pageSize != null && request.pageIndex == null)) {
      throw FormatException("Please set both pageSize and pageIndex");
    }

    http.Request clientRequest = _getHeader(accessToken, Endpoints.getContents);
    clientRequest.body = jsonEncode(request);

    return _getResponse(clientRequest);
  }

  ///Gets all the contents in a dialogue that matches the search keyword.
  ///Takes [request] of type SearchContentsRequest.
  Future<DialoguewiseResponse> searchContents(
      SearchContentsRequest request) async {
    if (request.slug.isEmpty) {
      throw FormatException("Please provide a Slug.");
    }

    http.Request clientRequest =
        _getHeader(accessToken, Endpoints.searchContents);
    clientRequest.body = jsonEncode(request);

    return _getResponse(clientRequest);
  }

  ///Adds content to a dialogue.
  ///Takes [request] of type AddContentsRequest.
  Future<DialoguewiseResponse> addContents(AddContentsRequest request) async {
    if (request.slug.isEmpty) {
      throw FormatException("Please provide a Slug.");
    } else if (request.contents.isEmpty) {
      throw FormatException("Please provide the contents to be added.");
    } else if (request.source.isEmpty) {
      throw FormatException("Please provide a source name.");
    }

    http.Request clientRequest = _getHeader(accessToken, Endpoints.addContents);
    clientRequest.body = jsonEncode(request);

    return _getResponse(clientRequest);
  }

  ///Update exisitng content.
  ///Takes [request] of type UpdateContentRequest.
  Future<DialoguewiseResponse> updateContent(
      UpdateContentRequest request) async {
    if (request.slug.isEmpty) {
      throw FormatException("Please provide a Slug.");
    } else if (request.content.fields.isEmpty) {
      throw FormatException("Please provide the contents to be added.");
    } else if (request.content.id == null || request.content.id!.isEmpty) {
      throw FormatException("Please provide content id.");
    } else if (request.source.isEmpty) {
      throw FormatException("Please provide a source name.");
    }

    http.Request clientRequest =
        _getHeader(accessToken, Endpoints.updateContent);
    clientRequest.body = jsonEncode(request);

    return _getResponse(clientRequest);
  }

  ///Delete exisitng content.
  ///Takes [request] of type DeleteContentRequest.
  Future<DialoguewiseResponse> deleteContent(
    DeleteContentRequest request,
  ) async {
    if (request.slug.isEmpty) {
      throw FormatException("Please provide a Slug.");
    } else if (request.contentId.isEmpty) {
      throw FormatException("Please provide the content id.");
    } else if (request.source.isEmpty) {
      throw FormatException("Please provide a source name.");
    }

    http.Request clientRequest =
        _getHeader(accessToken, Endpoints.deleteContent);
    clientRequest.body = jsonEncode(request);

    return _getResponse(clientRequest);
  }

  ///Uploads an image or file and returns the file URL.
  ///Takes [request] of type UploadMediaRequest.
  Future<DialoguewiseResponse> uploadMedia(UploadMediaRequest request) async {
    if (request.localFilePath.isEmpty) {
      throw FormatException(
          "Please provide the local path of file to be uploaded.");
    } else if (FileSystemEntity.typeSync(request.localFilePath) ==
        FileSystemEntityType.notFound) {
      throw FormatException("Unable to find file ${request.localFilePath}.");
    }

    var apiUrl = '${apiBaseUrl}dialogue/uploadmedia';
    var uri = Uri.parse(apiUrl);
    var httpRequest = http.MultipartRequest('POST', uri)
      ..headers['Access-Control-Allow-origin'] = '*'
      ..headers['Access-Control-Allow-Methods'] = '*'
      ..headers['Access-Control-Allow-Headers'] = 'Content-Type, Access-Token'
      ..headers['Access-Token'] = accessToken
      ..files.add(
          await http.MultipartFile.fromPath('file', request.localFilePath));
    var response = await httpRequest.send();
    DialoguewiseResponse dialogueWiseResponse = DialoguewiseResponse(
      reasonPhrase: response.reasonPhrase ?? 'Something went wrong.',
      statusCode: response.statusCode,
    );
    var responseBody = await response.stream.bytesToString();
    if (responseBody.isNotEmpty) {
      dialogueWiseResponse = dialogueWiseResponse.copyWith(
        response: jsonDecode(responseBody) as Map<String, dynamic>,
      );
    }

    return dialogueWiseResponse;
  }

  Future<DialoguewiseResponse> _getResponse(http.Request clientRequest) async {
    http.Client httpClient = http.Client();
    http.StreamedResponse response = await httpClient.send(clientRequest);
    String responseBody = await response.stream.bytesToString();
    httpClient.close();

    DialoguewiseResponse dialogueWiseResponse = DialoguewiseResponse(
      reasonPhrase: response.reasonPhrase ?? 'Something went wrong.',
      statusCode: response.statusCode,
    );

    if (responseBody.isNotEmpty) {
      try {
        dialogueWiseResponse = dialogueWiseResponse.copyWith(
          response: jsonDecode(responseBody) as Map<String, dynamic>,
        );
      } catch (e) {
        final Map<String, dynamic> errorResponse = {
          'error': 'Invalid server response.',
        };
        dialogueWiseResponse.response = errorResponse;
      }
    }

    return dialogueWiseResponse;
  }

  http.Request _getHeader(
    String accessToken,
    String apiRoute, {
    bool isGet = false,
  }) {
    var apiUrl = apiBaseUrl + apiRoute;
    http.Request clientRequest =
        http.Request(isGet ? 'GET' : 'POST', Uri.parse(apiUrl));
    clientRequest.headers['Access-Control-Allow-origin'] = '*';
    clientRequest.headers['Access-Control-Allow-Methods'] = '*';
    clientRequest.headers['Access-Control-Allow-Headers'] =
        'Content-Type, Access-Token';
    clientRequest.headers['Content-Type'] = 'application/json';
    clientRequest.headers['Access-Token'] = accessToken;

    return clientRequest;
  }
}
