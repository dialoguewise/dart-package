import 'dart:convert';

import 'package:dialogue_wise/DTOs/upload_media_request.dart';
import 'package:dialogue_wise/dialoguewise.dart';

void main() async {
  //Prepare the payload
  var request = UploadMediaRequest();
  request.accessToken = '<Provide access token>';
  request.localFilePath = '<Provide local file path>';

  // Call the Dialoguewise API
  var dialogueWiseService = DialoguewiseService();
  var res = await dialogueWiseService.uploadMedia(request);

  //Print the Output to Console
  print(jsonEncode(res));
}
