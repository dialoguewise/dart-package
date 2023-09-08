class EmailRequest {
  String from = '';
  List<String> to = [];
  List<String> cc = [];
  List<String> bcc = [];
  String subject = '';
  String body = '';

  Map<String, dynamic> toJson() => {
        'from': from,
        'to': to,
        'cc': cc,
        'bcc': bcc,
        'subject': subject,
        'body': body,
      };
}
