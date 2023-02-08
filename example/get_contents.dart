import 'dart:convert';

import 'package:dialogue_wise/DTOs/get_contents_request.dart';
import 'package:dialogue_wise/dialoguewise.dart';

void main() async {
  //Prepare the payload
  var request = GetContentsRequest();
  request.slug = '<Provide Slug>';
  request.accessToken = '<Provide access token>';

  // Call the Dialoguewise API
  final dialogueWiseService = DialoguewiseService(
    accessToken: '<Provide access token>',
  );
  var res = await dialogueWiseService.getContents(request);

  //Print the Output to Console
  print(jsonEncode(res));
}
