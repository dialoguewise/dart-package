///Field model class.
class Field {
  String name;
  String value;

  Map<String, dynamic> toJson() => {'name': name, 'value': value};
}
