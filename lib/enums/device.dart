///Device enums that can be used whenever a device needs to be set.
enum Device {
  Any,
  Desktop,
  Mobile,
  SmartWatch,
  Tablet,
  TV,
  IoT,
}

extension DeviceType on Device {
  String get Name {
    switch (this) {
      case Device.Desktop:
        return "Desktop";
      case Device.Mobile:
        return "Mobile";
      case Device.SmartWatch:
        return "SmartWatch";
      case Device.TV:
        return "TV";
      case Device.Tablet:
        return "Tablet";
      case Device.IoT:
        return "IoT";
      default:
        return null;
    }
  }
}
