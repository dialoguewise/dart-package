import 'package:dialogue_wise/dialogue_wise_request.dart';

///Creates a DeployDialogueRequest payload that allows you to deploy a Dialogue.
class DeployDialogueRequest extends DialogueWiseRequest
{
  ///Sets if the Dialogue should be deployed in Pilot mode.
  bool isPilot;
}