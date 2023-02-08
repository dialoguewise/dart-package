import 'dart:convert';

import 'package:dialogue_wise/DTOs/get_variables_request.dart';
import 'package:dialogue_wise/dialoguewise.dart';

void main() async {
  //Prepare the payload
  var request = GetVariablesRequest();
  request.slug = '<Provide Slug>';
  request.accessToken = '<Provide access token>';

  // Call the Dialoguewise API
  var dialogueWiseService = DialoguewiseService();
  var res = await dialogueWiseService.getVariables(request);

  //Print the Output to Console
  print(jsonEncode(res));
}
