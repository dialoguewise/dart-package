import 'package:dialogue_wise/DTOs/dialoguewise_request.dart';

///Creates a SearchContentsRequest payload that allows filter contents of a Dialogue.
class SearchContentsRequest extends DialoguewiseRequest {
  ///Sets the variables.
  Map<String, dynamic> variables;

  ///Set the search keyword based on which the content should be filtered.
  String keyword;

  ///Set this to true to get Piloted content.
  bool isPilot;

  Map<String, dynamic> toJson() => {
        'accessToken': accessToken,
        'slug': slug,
        'keyword': keyword,
        'IsPilotVersion': isPilot,
        'variables': variables,
      };
}
