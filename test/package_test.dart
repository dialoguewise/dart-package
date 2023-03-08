import 'package:dialogue_wise/DTOs/dialoguewise_response.dart';
import 'package:dialogue_wise/DTOs/get_contents_request.dart';
import 'package:dialogue_wise/dialoguewise.dart';
import 'package:test/test.dart';

void main() {
  test('call getdialogue API Endpoint', () async {
    var request = GetContentsRequest();
    request.slug = 'hero-section';

    // Call the Dialoguewise API
    final dialogueWiseService = DialoguewiseService(
      accessToken: 'b1266377591c4f2a9494c3abdd2cac5381D6Z825D26CEBAE8B6rn',
    );
    final DialoguewiseResponse res =
        await dialogueWiseService.getContents(request);

    expect(res.response['totalRecords'], equals(1));
    expect(res.response['error'], equals(''));
  });
}
