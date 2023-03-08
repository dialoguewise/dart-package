///Creates a DialogueWiseResponse response object that would contain the response from Dialoguewise.

class DialoguewiseResponse {
  ///Indicates the HTTP status code
  int statusCode = 0;

  ///Indicates the reason phrase of the HTTP status
  String reasonPhrase = '';

  ///Contains the response from Dialoguewise
  Map<String, dynamic> response = <String, dynamic>{};

  // Constructor
  DialoguewiseResponse({
    required this.statusCode,
    required this.reasonPhrase,
    this.response = const {},
  });

  // Copywith method
  DialoguewiseResponse copyWith({
    int? statusCode,
    String? reasonPhrase,
    Map<String, dynamic>? response,
  }) {
    return DialoguewiseResponse(
      statusCode: statusCode ?? this.statusCode,
      reasonPhrase: reasonPhrase ?? this.reasonPhrase,
      response: response ?? this.response,
    );
  }

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'reasonPhrase': reasonPhrase,
        'response': response
      };
}
