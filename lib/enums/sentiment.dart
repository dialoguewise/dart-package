///Sentiment enums that can be used whenever a sentiment needs to be set.
enum Sentiment { Any, Positive, Neutral, Negative }

extension SentimentType on Sentiment {
  String get type {
    switch (this) {
      case Sentiment.Positive:
        return "Positive";
      case Sentiment.Neutral:
        return "Neutral";
      case Sentiment.Negative:
        return "Negative";
      default:
        return "";
    }
  }
}
