import 'package:dialogue_wise/dialogue_wise.dart';
import 'package:dialogue_wise/deploy_dialogue_request.dart';
import 'dart:convert';
void main() async {
//Prepare the payload
  var request = new DeployDialogueRequest();
  request.slug = 'my-fab-food-store';
  request.apiKey = '[API Key]';
  request.emailHash = '[Email Hash]';
  request.isPilot=false;
  
// Call the Dialogue Wise API
  var dialogueWiseService = new DialogueWiseService();
  var res = await dialogueWiseService.deployDialogue(request);

//Print the Output to Console
  print(jsonEncode(res));
}
