import 'dart:convert';

import 'package:dialogue_wise/DTOs/delete_content_request.dart';
import 'package:dialogue_wise/dialoguewise.dart';

void main() async {
  //Prepare the payload
  var request = DeleteContentRequest();
  request.slug = '<Provide Slug>';

  request.contentId = "<Provide content id>";
  request.source = '<Provide a source name>';
// Call the Dialoguewise API
  final dialogueWiseService = DialoguewiseService(
    accessToken: '<Provide access token>',
  );
  var res = await dialogueWiseService.deleteContent(request);

//Print the Output to Console
  print(jsonEncode(res));
}
