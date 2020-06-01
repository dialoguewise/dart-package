import 'dart:io';
import 'package:dialogue_wise/dialogue_wise.dart';

void main() async{
//Prepare the payload
var request = new DialogueWiseRequest();
request.slug = 'hero-section';
request.apiKey = 'b1266377591c4f2a9494c3abdd2cac5381D6Z825D26CEBAE8B6rn';
request.emailHash='/kgmM46s1xC56BOFWRZp4j+0bdU19URpXdNT9liAX50=';

// Call the Dialogue Wise API
var dialogueWiseService = new DialogueWiseService(new HttpClient()); 
Map res = await dialogueWiseService.getDialogue(request);

//Print the Output to Console
print(res);

}