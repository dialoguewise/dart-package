import 'package:dialogue_wise/dialogue_wise_request.dart';

///Creates a SearchContentsRequest payload that allows filter contents of a Dialogue.
class SearchContentsRequest extends DialogueWiseRequest 
{
  ///Sets the variables.
  Map<String, dynamic> variables;

  ///Set the search keyword based on which the content should be filtered.
  String keyword;

  ///Sets the image transformation parameters. This parameter will be applied to all content of type Image.
  String imageTransformation;

  ///Set this to true to get Piloted content.
  bool isPilot;

  Map<String, dynamic> toJson() =>
    {
      'apiKey': apiKey,
      'emailHash': emailHash,
      'slug':slug,
      'keyword': keyword,
      'imageTransformation': imageTransformation,
      'IsPilotVersion': isPilot,
      'variables': variables,
    };
}