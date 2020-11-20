import 'package:dialogue_wise/dialogue_wise.dart';
import 'package:dialogue_wise/delete_content_request.dart';
import 'dart:convert';
void main() async {
//Prepare the payload
  var request = new DeleteContentRequest();
  request.slug = 'my-fab-food-store';
  request.apiKey = '[API Key]';
  request.emailHash = '[Email Hash]';
  request.id="EFE98BDB68904924B291B7B1B5764E83";
 
// Call the Dialogue Wise API
  var dialogueWiseService = new DialogueWiseService();
  var res = await dialogueWiseService.deleteContent(request);

//Print the Output to Console
  print(jsonEncode(res));
}
