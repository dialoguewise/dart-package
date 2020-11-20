import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:crypto/crypto.dart';
import 'search_contents_request.dart';
import 'add_contents_request.dart';
import 'update_content_request.dart';
import 'get_contents_request.dart';
import 'deploy_dialogue_request.dart';
import 'upload_media_request.dart';
import 'delete_content_request.dart';
import 'dialogue_wise_response.dart';
import 'dart:io';

///Allows you to manage your content using Dialogue Wise Headless CMS
class DialogueWiseService 
{
  
  String _apiBaseUrl = 'https://api.dialoguewise.com/api/';

  ///Gets all the contents in a dialogue.
  ///Takes parameter [request] of type GetContentsRequest.
  getContents(GetContentsRequest request) async 
  {
    if(request==null)
    {
      throw FormatException("Please provide a payload.");
    }
    else if(request.slug==null || request.slug.isEmpty)
    {
      throw FormatException("Please provide a Slug.");
    }
    else if(request.apiKey==null || request.apiKey.isEmpty)
    {
      throw FormatException("Please provide the API key.");
    }
    else if(request.emailHash==null || request.emailHash.isEmpty)
    {
      throw FormatException("Please provide the Email hash.");
    }
    else if ((request.pageSize == null && request.pageIndex != null) ||
        (request.pageSize != null && request.pageIndex == null)) 
    {
        throw FormatException("Please set both pageSize and pageIndex");
    } 

    var apiUrl = this._apiBaseUrl + 'dialogue/getcontents';
    http.Request clientRequest = _getHeader(apiUrl,'getcontents',request.apiKey,request.emailHash);
    clientRequest.body = jsonEncode(request);

    return _getResponse(clientRequest);
  }

  ///Gets all the contents in a dialogue that matches the search keyword.
  ///Takes [request] of type SearchContentsRequest.
  searchContents(SearchContentsRequest request) async {
    var apiUrl = this._apiBaseUrl + 'dialogue/searchcontents';

    if(request==null)
    {
      throw FormatException("Please provide a payload.");
    }
    else if(request.slug==null || request.slug.isEmpty)
    {
      throw FormatException("Please provide a Slug.");
    }
    else if(request.apiKey==null || request.apiKey.isEmpty)
    {
      throw FormatException("Please provide the API key.");
    }
    else if(request.emailHash==null || request.emailHash.isEmpty)
    {
      throw FormatException("Please provide the Email hash.");
    }

    http.Request clientRequest = _getHeader(apiUrl,'searchcontents',request.apiKey,request.emailHash);
    clientRequest.body = jsonEncode(request);

    return _getResponse(clientRequest);
  }

  ///Adds content to a dialogue.
  ///Takes [request] of type AddContentsRequest.
  addContents(AddContentsRequest request) async {
    var apiUrl = this._apiBaseUrl + 'dialogue/addcontents';

    if(request==null)
    {
      throw FormatException("Please provide a payload.");
    }
    else if(request.slug==null || request.slug.isEmpty)
    {
      throw FormatException("Please provide a Slug.");
    }
    else if(request.apiKey==null || request.apiKey.isEmpty)
    {
      throw FormatException("Please provide the API key.");
    }
    else if(request.emailHash==null || request.emailHash.isEmpty)
    {
      throw FormatException("Please provide the Email hash.");
    }
    else if(request.contents==null || request.contents.isEmpty)
    {
      throw FormatException("Please provide the contents to be added.");
    }

    http.Request clientRequest = _getHeader(apiUrl,'addcontents',request.apiKey,request.emailHash);
    clientRequest.body = jsonEncode(request);

    return _getResponse(clientRequest);
  }

  ///Update exisitng content.
  ///Takes [request] of type UpdateContentRequest.
  updateContent(UpdateContentRequest request) async {
    var apiUrl = this._apiBaseUrl + 'dialogue/updatecontent';

    if(request==null)
    {
      throw FormatException("Please provide a payload.");
    }
    else if(request.slug==null || request.slug.isEmpty)
    {
      throw FormatException("Please provide a Slug.");
    }
    else if(request.apiKey==null || request.apiKey.isEmpty)
    {
      throw FormatException("Please provide the API key.");
    }
    else if(request.emailHash==null || request.emailHash.isEmpty)
    {
      throw FormatException("Please provide the Email hash.");
    }
    else if(request.content==null || request.content.fields.isEmpty)
    {
      throw FormatException("Please provide the contents to be added.");
    }
    else if(request.content.id==null || request.content.id.isEmpty)
    {
      throw FormatException("Please provide content id.");
    }

    http.Request clientRequest = _getHeader(apiUrl,'updatecontent',request.apiKey,request.emailHash);
    clientRequest.body = jsonEncode(request);

    return _getResponse(clientRequest);
  }


  ///Delete exisitng content.
  ///Takes [request] of type DeleteContentRequest.
  deleteContent(DeleteContentRequest request) async 
  {
    var apiUrl = this._apiBaseUrl + 'dialogue/deletecontent';

    if(request==null)
    {
      throw FormatException("Please provide a payload.");
    }
    else if(request.slug==null || request.slug.isEmpty)
    {
      throw FormatException("Please provide a Slug.");
    }
    else if(request.apiKey==null || request.apiKey.isEmpty)
    {
      throw FormatException("Please provide the API key.");
    }
    else if(request.emailHash==null || request.emailHash.isEmpty)
    {
      throw FormatException("Please provide the Email hash.");
    }
    else if(request.id==null || request.id.isEmpty)
    {
      throw FormatException("Please provide the content id.");
    }

    http.Request clientRequest = _getHeader(apiUrl,'deletecontent',request.apiKey,request.emailHash);
    clientRequest.body = jsonEncode(request);

    return _getResponse(clientRequest);
  }

///Deploys a dialogue as Published or Piloted version.
///Takes [request] of type DeployDialogueRequest.
deployDialogue(DeployDialogueRequest request) async
{
    if(request==null || request.slug.isEmpty)
    {
      throw FormatException("Please provide a Slug.");
    }

    var isPilotFlag = request.isPilot != null && request.isPilot ? '&isPilot=true' : '';
    var apiUrl = this._apiBaseUrl + 'dialogue/deploydialogue?slug=' + request.slug + isPilotFlag;

    http.Request clientRequest = _getHeader(apiUrl,'deploydialogue',request.apiKey,request.emailHash);
    

    return _getResponse(clientRequest);
}

///Uploads an image or file and returns the file URL.
///Takes [request] of type UploadMediaRequest.
uploadMedia(UploadMediaRequest request) async
{
  if(request==null)
  {
    throw FormatException("Please provide a payload.");
  }
  else if(request.apiKey==null || request.apiKey.isEmpty)
  {
    throw FormatException("Please provide the API key.");
  }
  else if(request.emailHash==null || request.emailHash.isEmpty)
  {
    throw FormatException("Please provide the Email hash.");
  }
  else if(request.localFilePath==null || request.localFilePath.isEmpty)
  {
    throw FormatException("Please provide the local path of file to be uploaded.");
  }
  else if(FileSystemEntity.typeSync(request.localFilePath) == FileSystemEntityType.notFound)
  {
    throw FormatException("Unable to find file " + request.localFilePath + ".");
  }

  var currentUtc = DateFormat('dd/MM/y hh:mm:ss a').format(DateTime.now().toUtc());
  var message = '/api/dialogue/uploadmedia:' + currentUtc;
  // hash message
  var key = utf8.encode(request.apiKey);
  var bytes = utf8.encode(message);
  var hmacSha256 = Hmac(sha256, key);
  var digest = hmacSha256.convert(bytes);
  String hashMessage = base64.encode(digest.bytes);

  var authentication = request.emailHash + ':' + hashMessage;
  var apiUrl = this._apiBaseUrl + 'dialogue/uploadmedia';
  var uri = Uri.parse(apiUrl);
  var httpRequest = http.MultipartRequest('POST', uri)
    ..headers['Access-Control-Allow-origin']='*'
    ..headers['Access-Control-Allow-Methods']='*'
    ..headers['Access-Control-Allow-Headers']='Content-Type, Timestamp, Authentication'
    ..headers['Authentication'] = authentication
    ..headers['Timestamp'] = currentUtc
    ..files.add(await http.MultipartFile.fromPath(
        'file', request.localFilePath));
  var response = await httpRequest.send();
  var dialogueWiseResponse = new DialogueWiseResponse();
  dialogueWiseResponse.statusCode=response.statusCode;
  dialogueWiseResponse.reasonPhrase=response.reasonPhrase;
  var responseBody = await response.stream.bytesToString();
  if(responseBody!=null && responseBody.isNotEmpty)
  {
    dialogueWiseResponse.response = jsonDecode(responseBody) as Map;
  }
  
  return dialogueWiseResponse;
}

_getResponse(http.Request clientRequest) async{
    http.Client _httpClient = new http.Client();
    http.StreamedResponse response = await _httpClient.send(clientRequest);
    String responseBody = await response.stream.bytesToString();
    _httpClient.close();

    var dialogueWiseResponse = new DialogueWiseResponse();
    dialogueWiseResponse.statusCode=response.statusCode;
    dialogueWiseResponse.reasonPhrase=response.reasonPhrase;

    if(responseBody!=null && responseBody.isNotEmpty)
    {
      try
      {
        dialogueWiseResponse.response = jsonDecode(responseBody) as Map;
      }
      catch(e){
        String errorResponse = "{\"error\":\"Invalid server response.\"}";
        dialogueWiseResponse.response = jsonDecode(errorResponse) as Map;
      }
    }

    return dialogueWiseResponse;
}

  _getHeader(String apiUrl,String apiAction, String apiKey, String emailHash){
    var currentUtc = DateFormat('dd/MM/y hh:mm:ss a').format(DateTime.now().toUtc());
    var message = '/api/dialogue/' + apiAction + ':' + currentUtc;
    // hash message
    var key = utf8.encode(apiKey);
    var bytes = utf8.encode(message);
    var hmacSha256 = Hmac(sha256, key);
    var digest = hmacSha256.convert(bytes);
    String hashMessage = base64.encode(digest.bytes);

    var authentication = emailHash + ':' + hashMessage;
    http.Request clientRequest = new http.Request('POST', Uri.parse(apiUrl));
    clientRequest.headers['Access-Control-Allow-origin'] = '*';
    clientRequest.headers['Access-Control-Allow-Methods'] = '*';
    clientRequest.headers['Access-Control-Allow-Headers'] =
        'Content-Type, Timestamp, Authentication';
    clientRequest.headers['Content-Type'] = 'application/json';
    clientRequest.headers['Authentication'] = authentication;
    clientRequest.headers['Timestamp'] = currentUtc;

    return clientRequest;
  }
}


