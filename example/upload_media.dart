import 'dart:convert';

import 'package:dialogue_wise/DTOs/upload_media_request.dart';
import 'package:dialogue_wise/DTOs/upload_media_with_path.dart';
import 'package:dialogue_wise/dialoguewise.dart';

void main() async {
  // Upload Media with fileData
  //Prepare the payload
  var request = UploadMediaRequest();
  request.fileData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  request.mimeType = 'image/png';
  request.fileName = 'test.png';

  // Call the Dialoguewise API
  final dialogueWiseService = DialoguewiseService(
    accessToken: '<Provide access token>',
  );
  var res = await dialogueWiseService.uploadMedia(request);

  //Print the Output to Console
  print(jsonEncode(res));

  // Upload Media with filePath
  //Prepare the payload
  var request2 = UploadMediaWithPath();
  request2.filePath = '<Provide file path>';
  request2.fileName = 'test.png';

  // Call the Dialoguewise API
  final result = await dialogueWiseService.uploadMediaByPath(request2);

  //Print the Output to Console
  print(jsonEncode(result));
}
