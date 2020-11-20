import 'package:dialogue_wise/dialogue_wise_request.dart';

///Creates a DeleteContentRequest payload that allows you to delete a content from a Dialogue.
class DeleteContentRequest extends DialogueWiseRequest
{
  ///The id of the content you want to delete.
  String id;

  Map<String, dynamic> toJson() =>
    {
      'slug': slug,
      'id': id,
      'apiKey': apiKey,
      'emailHash': emailHash,
    };
}