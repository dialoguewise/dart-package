import 'package:dialogue_wise/dialoguewise.dart';
import 'package:dialogue_wise/DTOs/search_contents_request.dart';
import 'dart:convert';

void main() async {
//Prepare the payload
  var request = new SearchContentsRequest();
  request.slug = '<Provide Slug>';
  request.accessToken = '<Provide access token>';
  request.keyword = '<Provide search keyword>';

// Call the Dialoguewise API
  var dialogueWiseService = new DialoguewiseService();
  var res = await dialogueWiseService.searchContents(request);

//Print the Output to Console
  print(jsonEncode(res));
}
