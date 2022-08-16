import 'dart:convert';
import 'package:dialogue_wise/DTOs/get_variables_request.dart';
import 'package:http/http.dart' as http;
import 'package:dialogue_wise/DTOs/search_contents_request.dart';
import 'package:dialogue_wise/DTOs/add_contents_request.dart';
import 'package:dialogue_wise/DTOs/update_content_request.dart';
import 'package:dialogue_wise/DTOs/get_contents_request.dart';
import 'package:dialogue_wise/DTOs/upload_media_request.dart';
import 'package:dialogue_wise/DTOs/delete_content_request.dart';
import 'package:dialogue_wise/DTOs/dialoguewise_response.dart';
import 'dart:io';

///Allows you to manage your content using Dialoguewise Headless CMS
class DialoguewiseService {
  String _apiBaseUrl;

  DialoguewiseService({String apiBaseUrl = null}) {
    if (apiBaseUrl != null && !apiBaseUrl.isEmpty) {
      this._apiBaseUrl = (apiBaseUrl[apiBaseUrl.length - 1] != '/'
              ? (apiBaseUrl + "/")
              : apiBaseUrl) +
          "api/";
      ;
    } else {
      this._apiBaseUrl = null;
    }
  }

  String get apiBaseUrl {
    if (_apiBaseUrl == null) {
      return 'https://api.dialoguewise.com/api/';
    }

    return _apiBaseUrl;
  }

  ///Gets all the published Dialogues in a project.
  ///Takes parameter [accessToken] of type String as access token.
  getDialogues(String accessToken) async {
    if (accessToken == null || accessToken.isEmpty) {
      throw FormatException("Please provide the access token.");
    }

    http.Request clientRequest =
        _getHeader(accessToken, 'dialogue/getDialogues', isGet: true);

    return _getResponse(clientRequest);
  }

  ///Gets all the Variables of a published Dialogue.
  ///Takes parameter [request] of type GetVariablesRequest.
  getVariables(GetVariablesRequest request) async {
    if (request.accessToken == null || request.accessToken.isEmpty) {
      throw FormatException("Please provide the access token.");
    } else if (request.slug == null || request.accessToken.isEmpty) {
      throw FormatException("Please provide the Slug.");
    }

    http.Request clientRequest = _getHeader(
        request.accessToken, 'dialogue/getVariables?slug=' + request.slug,
        isGet: true);

    return _getResponse(clientRequest);
  }

  ///Gets all the contents in a dialogue.
  ///Takes parameter [request] of type GetContentsRequest.
  getContents(GetContentsRequest request) async {
    if (request == null) {
      throw FormatException("Please provide a payload.");
    } else if (request.slug == null || request.slug.isEmpty) {
      throw FormatException("Please provide a Slug.");
    } else if (request.accessToken == null || request.accessToken.isEmpty) {
      throw FormatException("Please provide the access token.");
    } else if ((request.pageSize == null && request.pageIndex != null) ||
        (request.pageSize != null && request.pageIndex == null)) {
      throw FormatException("Please set both pageSize and pageIndex");
    }

    http.Request clientRequest =
        _getHeader(request.accessToken, 'dialogue/getContents');
    clientRequest.body = jsonEncode(request);

    return _getResponse(clientRequest);
  }

  ///Gets all the contents in a dialogue that matches the search keyword.
  ///Takes [request] of type SearchContentsRequest.
  searchContents(SearchContentsRequest request) async {
    if (request == null) {
      throw FormatException("Please provide a payload.");
    } else if (request.slug == null || request.slug.isEmpty) {
      throw FormatException("Please provide a Slug.");
    } else if (request.accessToken == null || request.accessToken.isEmpty) {
      throw FormatException("Please provide the access token.");
    }

    http.Request clientRequest =
        _getHeader(request.accessToken, 'dialogue/searchContents');
    clientRequest.body = jsonEncode(request);

    return _getResponse(clientRequest);
  }

  ///Adds content to a dialogue.
  ///Takes [request] of type AddContentsRequest.
  addContents(AddContentsRequest request) async {
    if (request == null) {
      throw FormatException("Please provide a payload.");
    } else if (request.slug == null || request.slug.isEmpty) {
      throw FormatException("Please provide a Slug.");
    } else if (request.accessToken == null || request.accessToken.isEmpty) {
      throw FormatException("Please provide the access token.");
    } else if (request.contents == null || request.contents.isEmpty) {
      throw FormatException("Please provide the contents to be added.");
    } else if (request.source == null || request.source.isEmpty) {
      throw FormatException("Please provide a source name.");
    }

    http.Request clientRequest =
        _getHeader(request.accessToken, 'dialogue/addcontents');
    clientRequest.body = jsonEncode(request);

    return _getResponse(clientRequest);
  }

  ///Update exisitng content.
  ///Takes [request] of type UpdateContentRequest.
  updateContent(UpdateContentRequest request) async {
    if (request == null) {
      throw FormatException("Please provide a payload.");
    } else if (request.slug == null || request.slug.isEmpty) {
      throw FormatException("Please provide a Slug.");
    } else if (request.accessToken == null || request.accessToken.isEmpty) {
      throw FormatException("Please provide the access token.");
    } else if (request.content == null || request.content.fields.isEmpty) {
      throw FormatException("Please provide the contents to be added.");
    } else if (request.content.id == null || request.content.id.isEmpty) {
      throw FormatException("Please provide content id.");
    } else if (request.source == null || request.source.isEmpty) {
      throw FormatException("Please provide a source name.");
    }

    http.Request clientRequest =
        _getHeader(request.accessToken, 'dialogue/updatecontent');
    clientRequest.body = jsonEncode(request);

    return _getResponse(clientRequest);
  }

  ///Delete exisitng content.
  ///Takes [request] of type DeleteContentRequest.
  deleteContent(DeleteContentRequest request) async {
    if (request == null) {
      throw FormatException("Please provide a payload.");
    } else if (request.slug == null || request.slug.isEmpty) {
      throw FormatException("Please provide a Slug.");
    } else if (request.accessToken == null || request.accessToken.isEmpty) {
      throw FormatException("Please provide the access token.");
    } else if (request.contentId == null || request.contentId.isEmpty) {
      throw FormatException("Please provide the content id.");
    } else if (request.source == null || request.source.isEmpty) {
      throw FormatException("Please provide a source name.");
    }

    http.Request clientRequest =
        _getHeader(request.accessToken, 'dialogue/deletecontent');
    clientRequest.body = jsonEncode(request);

    return _getResponse(clientRequest);
  }

  ///Uploads an image or file and returns the file URL.
  ///Takes [request] of type UploadMediaRequest.
  uploadMedia(UploadMediaRequest request) async {
    if (request == null) {
      throw FormatException("Please provide a payload.");
    } else if (request.accessToken == null || request.accessToken.isEmpty) {
      throw FormatException("Please provide the access token.");
    } else if (request.localFilePath == null || request.localFilePath.isEmpty) {
      throw FormatException(
          "Please provide the local path of file to be uploaded.");
    } else if (FileSystemEntity.typeSync(request.localFilePath) ==
        FileSystemEntityType.notFound) {
      throw FormatException(
          "Unable to find file " + request.localFilePath + ".");
    }

    var apiUrl = this.apiBaseUrl + 'dialogue/uploadmedia';
    var uri = Uri.parse(apiUrl);
    var httpRequest = http.MultipartRequest('POST', uri)
      ..headers['Access-Control-Allow-origin'] = '*'
      ..headers['Access-Control-Allow-Methods'] = '*'
      ..headers['Access-Control-Allow-Headers'] = 'Content-Type, Access-Token'
      ..headers['Access-Token'] = request.accessToken
      ..files.add(
          await http.MultipartFile.fromPath('file', request.localFilePath));
    var response = await httpRequest.send();
    var dialogueWiseResponse = new DialoguewiseResponse();
    dialogueWiseResponse.statusCode = response.statusCode;
    dialogueWiseResponse.reasonPhrase = response.reasonPhrase;
    var responseBody = await response.stream.bytesToString();
    if (responseBody != null && responseBody.isNotEmpty) {
      dialogueWiseResponse.response = jsonDecode(responseBody) as Map;
    }

    return dialogueWiseResponse;
  }

  _getResponse(http.Request clientRequest) async {
    http.Client _httpClient = new http.Client();
    http.StreamedResponse response = await _httpClient.send(clientRequest);
    String responseBody = await response.stream.bytesToString();
    _httpClient.close();

    var dialogueWiseResponse = new DialoguewiseResponse();
    dialogueWiseResponse.statusCode = response.statusCode;
    dialogueWiseResponse.reasonPhrase = response.reasonPhrase;

    if (responseBody != null && responseBody.isNotEmpty) {
      try {
        dialogueWiseResponse.response = jsonDecode(responseBody) as Map;
      } catch (e) {
        String errorResponse = "{\"error\":\"Invalid server response.\"}";
        dialogueWiseResponse.response = jsonDecode(errorResponse) as Map;
      }
    }

    return dialogueWiseResponse;
  }

  _getHeader(String accessToken, String apiRoute, {bool isGet = false}) {
    var apiUrl = this.apiBaseUrl + apiRoute;
    http.Request clientRequest =
        new http.Request(isGet ? 'GET' : 'POST', Uri.parse(apiUrl));
    clientRequest.headers['Access-Control-Allow-origin'] = '*';
    clientRequest.headers['Access-Control-Allow-Methods'] = '*';
    clientRequest.headers['Access-Control-Allow-Headers'] =
        'Content-Type, Access-Token';
    clientRequest.headers['Content-Type'] = 'application/json';
    clientRequest.headers['Access-Token'] = accessToken;

    return clientRequest;
  }
}
