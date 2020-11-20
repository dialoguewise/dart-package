import 'package:test/test.dart';

import 'package:dialogue_wise/dialogue_wise.dart';
import 'package:dialogue_wise/get_contents_request.dart';

void main() {
  test('call getdialogue API Endpoint', () async {
    var request = new GetContentsRequest();
    request.slug = 'hero-section';
    request.apiKey = 'b1266377591c4f2a9494c3abdd2cac5381D6Z825D26CEBAE8B6rn';
    request.emailHash = '/kgmM46s1xC56BOFWRZp4j+0bdU19URpXdNT9liAX50=';

    // Call the Dialogue Wise API
    var dialogueWiseService = new DialogueWiseService();
    Map res = await dialogueWiseService.getContents(request);

    expect(res['totalRecords'], equals(1));
    expect(res['error'], equals(''));
  });
}
