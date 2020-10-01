import 'dart:io';
import 'package:dialogue_wise/dialogue_wise.dart';

void main() async{
//Prepare the payload
var request = new DialogueWiseRequest();
request.slug = 'my-fab-food-store';
request.apiKey = '82e2934400364fab877809bd9c40eefa91B93BAD81F7A1FC8FDF2DD1';
request.emailHash='AzLAgRn7emIb+9UUgAmJQewbrk2oLaf5D8KYMG8tHro=';
request.searchKeyword='yummy';
// Call the Dialogue Wise API
var dialogueWiseService = new DialogueWiseService(new HttpClient()); 
Map res = await dialogueWiseService.searchDialogue(request);

//Print the Output to Console
print(res);

}