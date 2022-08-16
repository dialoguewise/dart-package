import 'package:dialogue_wise/models/content.metadata.dart';
import 'package:dialogue_wise/models/field.dart';

///Content model class that contains the content metadata and fields.
class Content {
  ///The content metadata.
  ContentMetadata metadata;

  ///The fields and their corresponding values.
  List<Field> fields;

  ///The content id. Used for update or delete opration.
  String id;

  Map<String, dynamic> toJson() =>
      {'metadata': metadata, 'fields': fields, 'id': id};
}
