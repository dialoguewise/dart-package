import 'package:dialogue_wise/dialoguewise.dart';
import 'package:dialogue_wise/DTOs/add_contents_request.dart';
import 'package:dialogue_wise/enums/device.dart';
import 'package:dialogue_wise/models/content.dart';
import 'package:dialogue_wise/models/content.metadata.dart';
import 'dart:convert';

import 'package:dialogue_wise/models/field.dart';

void main() async {
  var request = new AddContentsRequest();
  request.slug = '<Provide Slug>';
  request.accessToken = '<Provide access token>';
  request.source = '<Provide a source name>';
  List<Field> fieldList = [];
  var field = new Field();
  field.name = '<Provide field name>';
  field.value = '<Provide field value>';
  fieldList.add(field);

  List<Content> contentList = [];
  var content = new Content();
  content.fields = fieldList;
  content.metadata = new ContentMetadata();
  content.metadata!.deviceType = Device.SmartWatch;
  contentList.add(content);
  request.contents = contentList;

  var dialogueWiseService = new DialoguewiseService();
  var res = await dialogueWiseService.addContents(request);

//Print the Output to Console
  print(jsonEncode(res));
}
