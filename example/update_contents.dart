import 'dart:convert';

import 'package:dialogue_wise/DTOs/update_content_request.dart';
import 'package:dialogue_wise/dialoguewise.dart';
import 'package:dialogue_wise/enums/device.dart';
import 'package:dialogue_wise/models/content.dart';
import 'package:dialogue_wise/models/content.metadata.dart';
import 'package:dialogue_wise/models/field.dart';

void main() async {
  var request = UpdateContentRequest();
  request.slug = '<Provide Slug>';
  request.accessToken = '<Provide access token>';

  List<Field> fieldList = [];
  var field = Field();
  field.name = '<Provide field name>';
  field.value = '<Provide field value>';
  fieldList.add(field);

  var content = Content();
  content.fields = fieldList;
  content.id = "<Provide content id>";
  request.source = "<Provide a source name>";

  content.metadata = ContentMetadata();
  content.metadata!.deviceType = Device.Mobile;
  request.content = content;

  final dialogueWiseService = DialoguewiseService(
    accessToken: '<Provide access token>',
  );
  var res = await dialogueWiseService.updateContent(request);

//Print the Output to Console
  print(jsonEncode(res));
}
