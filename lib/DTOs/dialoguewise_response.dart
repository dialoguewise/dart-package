///Creates a DialogueWiseResponse response object that would contain the response from Dialoguewise.
class DialoguewiseResponse {
  ///Indicates the HTTP status code
  int statusCode;

  ///Indicates the reason phrase of the HTTP status
  String reasonPhrase;

  ///Contains the response from Dialoguewise
  Map response;

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'reasonPhrase': reasonPhrase,
        'response': response
      };
}