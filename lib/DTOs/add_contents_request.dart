import 'package:dialogue_wise/DTOs/dialoguewise_request.dart';
import 'package:dialogue_wise/models/content.dart';

///Creates a AddContentsRequest payload that allows you to add contents to an existing Dialogue.
class AddContentsRequest extends DialoguewiseRequest {
  ///The list of contents you would like to add.
  List<Content> contents;

  Map<String, dynamic> toJson() => {
        'slug': slug,
        'source': source,
        'contents': contents,
        'accessToken': accessToken,
      };
}
