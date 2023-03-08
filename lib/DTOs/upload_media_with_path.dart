import 'package:dialogue_wise/DTOs/dialoguewise_request.dart';

/// Creates a UploadMediaWithPath payload uploads a media file.
/// [fileName] is the name of the file and is optional
/// [filePath] is the path of the file.
class UploadMediaWithPath extends DialoguewiseRequest {
  String? fileName;

  String filePath = '';
}
