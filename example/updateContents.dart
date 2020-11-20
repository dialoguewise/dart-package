import 'package:dialogue_wise/dialogue_wise.dart';
import 'package:dialogue_wise/update_content_request.dart';
import 'package:dialogue_wise/content.dart';
import 'dart:convert';
void main() async {



  var request = new UpdateContentRequest();
  request.slug = 'my-fab-food-store';
  request.apiKey = '[API Key]';
  request.emailHash = '[Email Hash]';

  var fieldList = new List<Field>();
  var field = new Field();
  field.name='name';
  field.value='This is new name';
  fieldList.add(field);

  field = new Field();
  field.name='desc';
  field.value='This is new description';
  fieldList.add(field);

  field = new Field();
  field.name='title';
  field.value='This is new title';
  fieldList.add(field);

  field = new Field();
  field.name='dob';
  field.value='18/10/2020';
  fieldList.add(field);

  field = new Field();
  field.name='has-photo';
  field.value='true';
  fieldList.add(field);
  
  var content = new Content();
  content.fields=fieldList;
  content.id="10ED90703C504B4A92E0CCABF1201152";
  content.country=Country.Zimbabwe;
  content.deviceType=Device.Mobile;
  content.sentimentType=Sentiment.Neutral;
  request.content=content;

  var dialogueWiseService = new DialogueWiseService();
  var res = await dialogueWiseService.updateContent(request);

//Print the Output to Console
  print(jsonEncode(res));

}