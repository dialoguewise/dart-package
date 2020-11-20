import 'dart:convert';

import 'package:dialogue_wise/dialogue_wise.dart';
import 'package:dialogue_wise/get_contents_request.dart';
void main() async {
//Prepare the payload
  var request = new GetContentsRequest();
  request.slug = 'my-fab-food-store';
  request.apiKey = '[API Key]';
  request.emailHash = '[Email Hash]';
  request.imageTransformation = 'mask=ellipse';
  request.isPilot=true;
  request.variables = new Map<String, dynamic>();
  request.variables ={
    "@testVar":"test var val",
    "@myExpVar":"my exp val"
  };
// Call the Dialogue Wise API
  var dialogueWiseService = new DialogueWiseService();
  var res = await dialogueWiseService.getContents(request);

//Print the Output to Console
  print(jsonEncode(res));
}
