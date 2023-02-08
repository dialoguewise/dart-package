import 'dart:convert';

import 'package:dialogue_wise/dialoguewise.dart';

void main() async {
  // Call the Dialoguewise API
  final dialogueWiseService = DialoguewiseService(
    accessToken: '<Provide access token>',
  );
  var res = await dialogueWiseService.getDialogues();

  //Print the Output to Console
  print(jsonEncode(res));
}
