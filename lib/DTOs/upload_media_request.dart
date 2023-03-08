import 'package:dialogue_wise/DTOs/dialoguewise_request.dart';

///Creates a UploadMediaRequest payload uploads a media file.\
///[fileName] is the name of the file and is optional
///[mimeType] is the mime type of the file.
///[fileData] is the file data in bytes.
class UploadMediaRequest extends DialoguewiseRequest {
  String? fileName;

  String mimeType = '';

  List<int> fileData = [];
}
