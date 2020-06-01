import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:crypto/crypto.dart';

class DialogueWiseService {
  HttpClient httpClient;
  String apiBaseUrl = 'https://api.dialoguewise.com/api/';

  DialogueWiseService(HttpClient httpClient) {
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

    var apiUrl = this.apiBaseUrl +
        'dialogue/getdialogue?dialogueName=' +
        request.slug +
        isPilotFlag +
        pageFlag;
    var message = '/api/dialogue/getdialogue:' + currentUtc;
    // hash message
    var key = utf8.encode(request.apiKey);
    var bytes = utf8.encode(message);
    var hmacSha256 = Hmac(sha256, key);
    var digest = hmacSha256.convert(bytes);
    String hashMessage = base64.encode(digest.bytes);
    Map<String, dynamic> data = request.variableList;

    var authentication = request.emailHash + ':' + hashMessage;

    HttpClientRequest clientRequest =
        await this.httpClient.postUrl(Uri.parse(apiUrl));
    clientRequest.headers.add('Access-Control-Allow-origin', '*');
    clientRequest.headers.add('Access-Control-Allow-Methods', '*');
    clientRequest.headers.add('Access-Control-Allow-Headers',
        'Content-Type, Timestamp, Authentication');
    clientRequest.headers
        .add(HttpHeaders.contentTypeHeader, 'application/json');
    clientRequest.headers.add('Authentication', authentication);
    clientRequest.headers.add('Timestamp', currentUtc);
    // add data to request
    if (data != null && data.isNotEmpty) {
      clientRequest.write(jsonEncode(data));
    }
    HttpClientResponse response = await clientRequest.close();
    String responseBody = await response.transform(utf8.decoder).join();
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
}
