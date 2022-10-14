import 'package:dialogue_wise/DTOs/dialoguewise_request.dart';

///Creates a DeployDialogueRequest payload that allows you to deploy a Dialogue.
class DeployDialogueRequest extends DialoguewiseRequest {
  ///Sets if the Dialogue should be deployed in Pilot mode.
  bool? isPilot;
}
