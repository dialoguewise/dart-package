import 'package:dialogue_wise/enums/country.dart';
import 'package:dialogue_wise/enums/device.dart';
import 'package:dialogue_wise/enums/sentiment.dart';
import 'package:dialogue_wise/enums/text.direction.dart';

///ContentMetadata model class that contains the content metadata.
class ContentMetadata {
  ///Sets the country that you would like to target.
  Country? country;

  ///Sets the country subdivision code.
  String? countrySubdivisionCode;

  ///Sets the language code.
  String? languageCode;

  ///Sets the device that you would like to target.
  Device? deviceType;

  ///Sets the sentiment that you would like to target.
  Sentiment? sentimentType;

  TextDirection? textDirection;

  Map<String, dynamic> toJson() => {
        'countryCode': country?.code,
        'countrySubdivisionCode': countrySubdivisionCode,
        'languageCode': languageCode,
        'deviceType': deviceType?.name,
        'sentiment': sentimentType?.type,
        'textDirection': textDirection?.index
      };
}
