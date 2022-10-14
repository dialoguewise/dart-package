import 'package:dialogue_wise/DTOs/dialoguewise_request.dart';

///Creates a DeleteContentRequest payload that allows you to delete a content from a Dialogue.
class DeleteContentRequest extends DialoguewiseRequest {
  ///The id of the content you want to delete.
  String contentId = '';

  Map<String, dynamic> toJson() => {
        'slug': slug,
        'source': source,
        'contentId': contentId,
        'accessToken': accessToken,
      };
}
