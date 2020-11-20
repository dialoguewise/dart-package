import 'package:dialogue_wise/dialogue_wise_request.dart';
import 'package:dialogue_wise/content.dart';

///Creates a AddContentsRequest payload that allows you to add contents to an existing Dialogue.
class AddContentsRequest extends DialogueWiseRequest
{
  ///The list of contents you would like to add.
  List<Content> contents;

  Map<String, dynamic> toJson() =>
    {
      'slug': slug,
      'contents': contents,
      'apiKey': apiKey,
      'emailHash': emailHash,
    };
}

