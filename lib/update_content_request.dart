import 'package:dialogue_wise/dialogue_wise_request.dart';
import 'package:dialogue_wise/content.dart';

///Creates a UpdateContentRequest payload that allows update of contents.
class UpdateContentRequest extends DialogueWiseRequest
{
  ///Sets the content that needs to be updated.
  Content content;

  Map<String, dynamic> toJson() =>
    {
      'slug': slug,
      'content': content,
      'apiKey': apiKey,
      'emailHash': emailHash,
    };
}