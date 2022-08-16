import 'package:dialogue_wise/dialoguewise.dart';
import 'package:dialogue_wise/DTOs/delete_content_request.dart';
import 'dart:convert';

void main() async {
  //Prepare the payload
  var request = new DeleteContentRequest();
  request.slug = '<Provide Slug>';
  request.accessToken = '<Provide access token>';

  request.contentId = "<Provide content id>";
  request.source = '<Provide a source name>';
// Call the Dialoguewise API
  var dialogueWiseService = new DialoguewiseService();
  var res = await dialogueWiseService.deleteContent(request);

//Print the Output to Console
  print(jsonEncode(res));
}
