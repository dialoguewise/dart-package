import 'package:dialogue_wise/DTOs/dialoguewise_request.dart';

///Creates a GetContentsRequest payload that allows fetch contents of a Dialogue.
class GetContentsRequest extends DialoguewiseRequest {
  ///Sets the variables.
  Map<String, dynamic>? variables;

  ///Sets the page size for paginated data. You will need to set the pageIndex property as well.
  int? pageSize;

  ///Sets the page index. You will need to set the pageSize property as well.
  int? pageIndex;

  ///Set this to true to get Piloted content.
  bool? isPilot;

  Map<String, dynamic> toJson() => {
        'accessToken': accessToken,
        'slug': slug,
        'IsPilotVersion': isPilot,
        'variables': variables,
        'pageSize': pageSize,
        'pageIndex': pageIndex
      };
}
