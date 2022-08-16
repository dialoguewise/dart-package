import 'package:dialogue_wise/DTOs/dialoguewise_request.dart';
import 'package:dialogue_wise/models/content.dart';

///Creates a UpdateContentRequest payload that allows update of contents.
class UpdateContentRequest extends DialoguewiseRequest {
  ///Sets the content that needs to be updated.
  Content content;

  Map<String, dynamic> toJson() => {
        'slug': slug,
        'source': source,
        'content': content,
        'accessToken': accessToken,
      };
}
