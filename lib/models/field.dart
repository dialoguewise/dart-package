///Field model class.
class Field {
  late String name;
  late String value;

  Map<String, dynamic> toJson() => {'name': name, 'value': value};
}
