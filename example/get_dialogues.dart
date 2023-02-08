import 'dart:convert';

import 'package:dialogue_wise/dialoguewise.dart';

void main() async {
  // Call the Dialoguewise API
  var dialogueWiseService = DialoguewiseService();
  var res = await dialogueWiseService.getDialogues('<Provide API Key>');

  //Print the Output to Console
  print(jsonEncode(res));
}
