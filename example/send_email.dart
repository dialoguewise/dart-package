import 'dart:convert';
import 'package:dialogue_wise/DTOs/email_request.dart';
import 'package:dialogue_wise/dialoguewise.dart';

void main() async {
  //Prepare the payload
  var request = EmailRequest();
  request.from = '<Senders email Id>';
  request.to = ['<Receipient 1 email Id>', '<Receipient 2 email Id>'];
  request.cc = ['<Cc Receipient 1 email Id>', '<Cc Receipient 2 email Id>'];
  request.bcc = ['<Bcc Receipient 1 email Id>', '<Bcc Receipient 2 email Id>'];
  request.subject = "<The email subject>";
  request.body = "<The email body>";

  final dialogueWiseService = DialoguewiseService(
    accessToken: '<Provide access token>',
  );
  var res = await dialogueWiseService.sendEmail(request);

//Print the Output to Console
  print(jsonEncode(res));
}
