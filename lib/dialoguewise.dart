import 'dart:convert';
import 'dart:io';

import 'package:dialogue_wise/DTOs/add_contents_request.dart';
import 'package:dialogue_wise/DTOs/delete_content_request.dart';
import 'package:dialogue_wise/DTOs/dialoguewise_response.dart';
import 'package:dialogue_wise/DTOs/get_contents_request.dart';
import 'package:dialogue_wise/DTOs/get_variables_request.dart';
import 'package:dialogue_wise/DTOs/search_contents_request.dart';
import 'package:dialogue_wise/DTOs/update_content_request.dart';
import 'package:dialogue_wise/constants/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'DTOs/email_request.dart';

///Allows you to manage your content using Dialoguewise Headless CMS
class DialoguewiseService {
  String _apiBaseUrl = '';
  final String accessToken;

  DialoguewiseService({
    String? apiBaseUrl,
    required this.accessToken,
  }) : assert(accessToken.isNotEmpty, "Please provide the access token.") {
    if (apiBaseUrl != null && apiBaseUrl.isNotEmpty) {
      _apiBaseUrl =
          "${apiBaseUrl[apiBaseUrl.length - 1] != '/' ? '$apiBaseUrl/' : apiBaseUrl}api/";
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
  ///Returns a [DialoguewiseResponse] object.
  /// Example:
  /// ```dart
  /// final dialogueWiseService = DialoguewiseService(
  ///   accessToken: '<Provide access token>',
  /// );
  ///
  /// final res = await dialogueWiseService.getDialogues();
  Future<DialoguewiseResponse> getDialogues() async {
    http.Request clientRequest =
        _getHeader(accessToken, Endpoints.getDialogues, isGet: true);

    return _getResponse(clientRequest);
  }

  ///Gets all the Variables of a published Dialogue.
  ///Takes parameter [request] of type GetVariablesRequest.
  Future<DialoguewiseResponse> getVariables(GetVariablesRequest request) async {
    if (request.slug.isEmpty) {
      throw ArgumentError("Please provide the Slug.");
    }

    http.Request clientRequest = _getHeader(
      accessToken,
      '${Endpoints.getVariables}?slug=${request.slug}',
      isGet: true,
    );

    return _getResponse(clientRequest);
  }

  ///Gets all the contents in a dialogue.
  ///Takes parameter [request] of type GetContentsRequest.
  Future<DialoguewiseResponse> getContents(GetContentsRequest request) async {
    if (request.slug.isEmpty) {
      throw ArgumentError("Please provide a Slug.");
    } else if ((request.pageSize == null && request.pageIndex != null) ||
        (request.pageSize != null && request.pageIndex == null)) {
      throw ArgumentError("Please set both pageSize and pageIndex");
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
      throw ArgumentError("Please provide a Slug.");
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
      throw ArgumentError("Please provide a Slug.");
    } else if (request.contents.isEmpty) {
      throw ArgumentError("Please provide the contents to be added.");
    } else if (request.source.isEmpty) {
      throw ArgumentError("Please provide a source name.");
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
      throw ArgumentError("Please provide a Slug.");
    } else if (request.content.fields.isEmpty) {
      throw ArgumentError("Please provide the contents to be added.");
    } else if (request.content.id == null || request.content.id!.isEmpty) {
      throw ArgumentError("Please provide content id.");
    } else if (request.source.isEmpty) {
      throw ArgumentError("Please provide a source name.");
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
      throw ArgumentError("Please provide a Slug.");
    } else if (request.contentId.isEmpty) {
      throw ArgumentError("Please provide the content id.");
    } else if (request.source.isEmpty) {
      throw ArgumentError("Please provide a source name.");
    }

    http.Request clientRequest =
        _getHeader(accessToken, Endpoints.deleteContent);
    clientRequest.body = jsonEncode(request);

    return _getResponse(clientRequest);
  }

  ///Allows you to send an email.
  ///Takes [request] of type EmailRequest.
  Future<DialoguewiseResponse> sendEmail(
    EmailRequest request,
  ) async {
    if (request.from.isEmpty) {
      throw ArgumentError(
          "Please specify the sender's email address in the 'from' field.");
    } else if (request.subject.isEmpty) {
      throw ArgumentError("Please provide a subject.");
    } else if (request.body.isEmpty) {
      throw ArgumentError("Please provide the email content in 'body' field.");
    } else if (request.to.isEmpty &&
        request.cc.isEmpty &&
        request.bcc.isEmpty) {
      throw ArgumentError(
          "Please provide at least one recipient email address.");
    }

    http.Request clientRequest = _getHeader(accessToken, Endpoints.sendEmail);
    clientRequest.body = jsonEncode(request);

    return _getResponse(clientRequest);
  }

  /// Uploads an image or file given file path and returns the URL of uploaded file.
  /// Takes [filePath] which is the path to the local file.
  /// Throws [ArgumentError] if the file path is empty.
  /// Throws [FileSystemException] if the file does not exist.
  ///
  /// This is only supported on mobile platforms.
  Future<DialoguewiseResponse> uploadMediaByPath(String filePath) async {
    if (filePath.isEmpty) {
      throw ArgumentError(
          "Please provide the local path of file to be uploaded.");
    } else if (FileSystemEntity.typeSync(filePath) ==
        FileSystemEntityType.notFound) {
      throw FileSystemException("Unable to find file $filePath.");
    }

    final apiUrl = '$apiBaseUrl${Endpoints.uploadMedia}';
    final uri = Uri.parse(apiUrl);
    final httpRequest = http.MultipartRequest('POST', uri)
      ..headers['Access-Control-Allow-origin'] = '*'
      ..headers['Access-Control-Allow-Methods'] = '*'
      ..headers['Access-Control-Allow-Headers'] = 'Content-Type, Access-Token'
      ..headers['Access-Token'] = accessToken
      ..files.add(await http.MultipartFile.fromPath('file', filePath));
    final response = await httpRequest.send();

    var dialogueWiseResponse = DialoguewiseResponse(
      statusCode: response.statusCode,
      reasonPhrase: response.reasonPhrase ?? 'Something went wrong',
    );

    final responseBody = await response.stream.bytesToString();

    if (responseBody.isNotEmpty) {
      dialogueWiseResponse.response =
          jsonDecode(responseBody) as Map<String, dynamic>;
    }

    return dialogueWiseResponse;
  }

  ///Uploads an image or file and returns the file URL.
  ///Takes [fileName] as the name of the file.
  ///Takes [fileData] as the file binary data.
  ///Takes [mimeType] as the mime type.
  ///Throws [ArgumentError] if the file data is empty.
  ///Throws [ArgumentError] if the mime type is empty.
  Future<DialoguewiseResponse> uploadMedia(
      String fileName, List<int> fileData, String mimeType) async {
    if (fileData.isEmpty) {
      throw ArgumentError('Please provide the file data.');
    }
    if (mimeType.isEmpty) {
      throw ArgumentError('Please provide the mime type of the file.');
    }
    if (fileName.isEmpty) {
      throw ArgumentError('Please provide a filename.');
    }

    final apiUrl = '$apiBaseUrl${Endpoints.uploadMedia}';
    final uri = Uri.parse(apiUrl);

    final List<String> mediaType = mimeType.split('/');

    final httpRequest = http.MultipartRequest('POST', uri)
      ..headers['Access-Control-Allow-origin'] = '*'
      ..headers['Access-Control-Allow-Methods'] = '*'
      ..headers['Access-Control-Allow-Headers'] = 'Content-Type, Access-Token'
      ..headers['Access-Token'] = accessToken
      ..files.add(
        http.MultipartFile.fromBytes(
          'file',
          fileData,
          filename: fileName,
          contentType: MediaType(mediaType.first, mediaType.last),
        ),
      );

    final http.StreamedResponse response = await httpRequest.send();
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
