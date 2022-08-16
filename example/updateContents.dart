import 'package:dialogue_wise/dialoguewise.dart';
import 'package:dialogue_wise/DTOs/update_content_request.dart';
import 'package:dialogue_wise/enums/device.dart';
import 'package:dialogue_wise/models/content.dart';
import 'package:dialogue_wise/models/content.metadata.dart';
import 'dart:convert';

import 'package:dialogue_wise/models/field.dart';

void main() async {
  var request = new UpdateContentRequest();
  request.slug = '<Provide Slug>';
  request.accessToken = '<Provide access token>';

  List<Field> fieldList = [];
  var field = new Field();
  field.name = '<Provide field name>';
  field.value = '<Provide field value>';
  fieldList.add(field);

  var content = new Content();
  content.fields = fieldList;
  content.id = "<Provide content id>";
  request.source = "<Provide a source name>";

  content.metadata = new ContentMetadata();
  content.metadata.deviceType = Device.Mobile;
  request.content = content;

  var dialogueWiseService = new DialoguewiseService();
  var res = await dialogueWiseService.updateContent(request);

//Print the Output to Console
  print(jsonEncode(res));
}
