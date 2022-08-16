///Base class for all payloads.
class DialoguewiseRequest {
  ///Sets the Slug of a Dialogue.
  String slug;

  ///Sets the API key.
  String accessToken;

  ///If set to true, gets the piloted version
  bool isPilotVersion;

  ///Sets the source name
  String source;
}
