import 'dart:convert';

import 'package:dialogue_wise/DTOs/search_contents_request.dart';
import 'package:dialogue_wise/dialoguewise.dart';

void main() async {
//Prepare the payload
  var request = SearchContentsRequest();
  request.slug = '<Provide Slug>';
  request.accessToken = '<Provide access token>';
  request.keyword = '<Provide search keyword>';

// Call the Dialoguewise API
  var dialogueWiseService = DialoguewiseService();
  var res = await dialogueWiseService.searchContents(request);

//Print the Output to Console
  print(jsonEncode(res));
}
