import 'package:dialogue_wise/dialoguewise.dart';
import 'package:dialogue_wise/DTOs/upload_media_request.dart';
import 'dart:convert';

void main() async {
  //Prepare the payload
  var request = new UploadMediaRequest();
  request.accessToken = '<Provide access token>';
  request.localFilePath = '<Provide local file path>';

  // Call the Dialoguewise API
  var dialogueWiseService = new DialoguewiseService();
  var res = await dialogueWiseService.uploadMedia(request);

  //Print the Output to Console
  print(jsonEncode(res));
}
