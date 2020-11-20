import 'package:dialogue_wise/dialogue_wise_request.dart';

///Creates a GetContentsRequest payload that allows fetch contents of a Dialogue.
class GetContentsRequest extends DialogueWiseRequest 
{
  ///Sets the variables.
  Map<String, dynamic> variables;

  ///Sets the page size for paginated data. You will need to set the pageIndex property as well.
  int pageSize;

  ///Sets the page index. You will need to set the pageSize property as well.
  int pageIndex;

  ///Sets the image transformation parameters. This parameter will be applied to all content of type Image.
  String imageTransformation;

  ///Set this to true to get Piloted content.
  bool isPilot;

  Map<String, dynamic> toJson() =>
  {
    'apiKey': apiKey,
    'emailHash': emailHash,
    'slug':slug,
    'imageTransformation': imageTransformation,
    'IsPilotVersion': isPilot,
    'variables': variables,
    'pageSize': pageSize,
    'pageIndex': pageIndex
  };
}