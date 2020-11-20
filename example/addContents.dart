import 'package:dialogue_wise/dialogue_wise.dart';
import 'package:dialogue_wise/add_contents_request.dart';
import 'package:dialogue_wise/content.dart';
import 'dart:convert';
void main() async {



  var request = new AddContentsRequest();
  request.slug = 'my-fab-food-store';
  request.apiKey = '[API Key]';
  request.emailHash = '[Email Hash]';

  var fieldList = new List<Field>();
  var field = new Field();
  field.name='name';
  field.value='My name';
  fieldList.add(field);

  field = new Field();
  field.name='desc';
  field.value='this is the description';
  fieldList.add(field);

  field = new Field();
  field.name='title';
  field.value='this is the title';
  fieldList.add(field);

  field = new Field();
  field.name='dob';
  field.value='10/11/2020';
  fieldList.add(field);

  field = new Field();
  field.name='has-photo';
  field.value='true';
  fieldList.add(field);
  
  var contentList = new List<Content>();
  var content = new Content();
  content.fields=fieldList;
  content.country=Country.United_Arab_Emirates;
  content.deviceType=Device.Desktop;
  content.sentimentType=Sentiment.Positive;

  contentList.add(content);

  request.contents=contentList;

  var dialogueWiseService = new DialogueWiseService();
  var res = await dialogueWiseService.addContents(request);

//Print the Output to Console
  print(jsonEncode(res));

}