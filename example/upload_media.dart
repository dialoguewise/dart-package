import 'dart:convert';
import 'package:dialogue_wise/dialoguewise.dart';

void main() async {
  // Upload Media with fileData
  //Prepare the payload by reading the file. fileData is set to [1] just as an example
  var fileData = [1];
  var mimeType = 'image/png';
  var fileName = 'test.png';

  // Call the Dialoguewise API
  final dialogueWiseService = DialoguewiseService(
    accessToken: '<Provide access token>',
  );
  var res = await dialogueWiseService.uploadMedia(fileName, fileData, mimeType);

  //Print the Output to Console
  print(jsonEncode(res));

  // Upload Media with filePath
  //Prepare the payload
  var filePath = 'E:\\slide9.PNG';
  // Call the Dialoguewise API
  final result = await dialogueWiseService.uploadMediaByPath(filePath);

  //Print the Output to Console
  print(jsonEncode(result));
}
