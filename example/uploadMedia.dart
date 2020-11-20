import 'package:dialogue_wise/dialogue_wise.dart';
import 'package:dialogue_wise/upload_media_request.dart';
import 'dart:convert';
void main() async {
//Prepare the payload
  var request = new UploadMediaRequest();
  request.apiKey = '[API Key]';
  request.emailHash = '[Email Hash]';
  request.localFilePath='E:\\image.jpg';
  
// Call the Dialogue Wise API
  var dialogueWiseService = new DialogueWiseService();
  var res = await dialogueWiseService.uploadMedia(request);

//Print the Output to Console
  print(jsonEncode(res));
}
