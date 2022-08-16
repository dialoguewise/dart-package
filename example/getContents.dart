import 'dart:convert';

import 'package:dialogue_wise/dialoguewise.dart';
import 'package:dialogue_wise/DTOs/get_contents_request.dart';

void main() async {
  //Prepare the payload
  var request = new GetContentsRequest();
  request.slug = '<Provide Slug>';
  request.accessToken = '<Provide access token>';

  // Call the Dialoguewise API
  var dialogueWiseService = new DialoguewiseService();
  var res = await dialogueWiseService.getContents(request);

  //Print the Output to Console
  print(jsonEncode(res));
}
