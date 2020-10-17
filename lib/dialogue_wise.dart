import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:crypto/crypto.dart';

class DialogueWiseService {
  http.Client httpClient;
  String apiBaseUrl = 'https://api.dialoguewise.com/api/';

  DialogueWiseService(http.Client httpClient) {
    this.httpClient = httpClient;
  }

  getDialogue(DialogueWiseRequest request) async {
    var currentUtc =
        DateFormat('dd/MM/y hh:mm:ss a').format(DateTime.now().toUtc());
    //The Pilot flag allows you to get the piloted content. Allows you to test your content.
    var isPilotFlag = request.isPilot != null && request.isPilot
        ? '&isPilotVersion=true'
        : '';
    var pageFlag = '';
    var imageTransParam = '';

    if ((request.pageSize == null && request.pageIndex != null) ||
        (request.pageSize != null && request.pageIndex == null)) {
      throw FormatException("Please set both pageSize and pageIndex");
    } else if (request.pageSize != null && request.pageIndex != null) {
      //The page flag allows you to get paginated data. If not passed it will return all data.
      pageFlag = '&pageSize=' +
          request.pageSize.toString() +
          '&pageIndex=' +
          request.pageIndex.toString();
    }

    if (request.imageTransformation != null &&
        !request.imageTransformation.isEmpty) {
      imageTransParam = '&imageTransformation=' + request.imageTransformation;
    }

    var apiUrl = this.apiBaseUrl +
        'dialogue/getdialogue?dialogueName=' +
        request.slug +
        isPilotFlag +
        pageFlag +
        imageTransParam;
    var message = '/api/dialogue/getdialogue:' + currentUtc;
    // hash message
    var key = utf8.encode(request.apiKey);
    var bytes = utf8.encode(message);
    var hmacSha256 = Hmac(sha256, key);
    var digest = hmacSha256.convert(bytes);
    String hashMessage = base64.encode(digest.bytes);
    Map<String, dynamic> data = request.variableList;

    var authentication = request.emailHash + ':' + hashMessage;

    http.Request clientRequest = new http.Request('POST', Uri.parse(apiUrl));
    clientRequest.headers['Access-Control-Allow-origin'] = '*';
    clientRequest.headers['Access-Control-Allow-Methods'] = '*';
    clientRequest.headers['Access-Control-Allow-Headers'] =
        'Content-Type, Timestamp, Authentication';
    clientRequest.headers['Content-Type'] = 'application/json';
    clientRequest.headers['Authentication'] = authentication;
    clientRequest.headers['Timestamp'] = currentUtc;
    // add data to request
    if (data != null && data.isNotEmpty) {
      clientRequest.body = jsonEncode(data);
    }
    http.StreamedResponse response = await httpClient.send(clientRequest);
    String responseBody = await response.stream.bytesToString();
    Map jsonResponse = jsonDecode(responseBody) as Map;
    this.httpClient.close();
    return jsonResponse;
  }

  searchDialogue(DialogueWiseRequest request) async {
    var currentUtc =
        DateFormat('dd/MM/y hh:mm:ss a').format(DateTime.now().toUtc());
    //The Pilot flag allows you to get the piloted content. Allows you to test your content.
    var isPilotFlag = request.isPilot != null && request.isPilot
        ? '&isPilotVersion=true'
        : '';
    var imageTransParam = '';
    var searchKeyword = '';

    if (request.imageTransformation != null &&
        !request.imageTransformation.isEmpty) {
      imageTransParam = '&imageTransformation=' + request.imageTransformation;
    }

    if (request.searchKeyword != null && !request.searchKeyword.isEmpty) {
      searchKeyword = '&keyword=' + request.searchKeyword;
    }

    var apiUrl = this.apiBaseUrl +
        'dialogue/searchdialogue?dialogueName=' +
        request.slug +
        isPilotFlag +
        imageTransParam +
        searchKeyword;
    var message = '/api/dialogue/searchdialogue:' + currentUtc;
    // hash message
    var key = utf8.encode(request.apiKey);
    var bytes = utf8.encode(message);
    var hmacSha256 = Hmac(sha256, key);
    var digest = hmacSha256.convert(bytes);
    String hashMessage = base64.encode(digest.bytes);
    Map<String, dynamic> data = request.variableList;

    var authentication = request.emailHash + ':' + hashMessage;

    http.Request clientRequest = new http.Request('POST', Uri.parse(apiUrl));
    clientRequest.headers['Access-Control-Allow-origin'] = '*';
    clientRequest.headers['Access-Control-Allow-Methods'] = '*';
    clientRequest.headers['Access-Control-Allow-Headers'] =
        'Content-Type, Timestamp, Authentication';
    clientRequest.headers['Content-Type'] = 'application/json';
    clientRequest.headers['Authentication'] = authentication;
    clientRequest.headers['Timestamp'] = currentUtc;
    // add data to request
    if (data != null && data.isNotEmpty) {
      clientRequest.body = jsonEncode(data);
    }
    http.StreamedResponse response = await httpClient.send(clientRequest);
    String responseBody = await response.stream.bytesToString();
    Map jsonResponse = jsonDecode(responseBody) as Map;
    this.httpClient.close();
    return jsonResponse;
  }
}

class DialogueWiseRequest {
  String slug;
  bool isPilot;
  String apiKey;
  String emailHash;
  Map<String, dynamic> variableList;
  int pageSize;
  int pageIndex;
  String searchKeyword;
  String imageTransformation;
}
