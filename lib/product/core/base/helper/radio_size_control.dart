enum RadioSizeEnum {
  smallSize,
  defaultSize,
  largeSize,
  customSize,
}

extension SwitchSizeExtension on RadioSizeEnum {
  double size(double? value) {
    switch (this) {
      case RadioSizeEnum.smallSize:
        return 0.7;
      case RadioSizeEnum.defaultSize:
        return 1.0;
      case RadioSizeEnum.largeSize:
        return 1.5;
      case RadioSizeEnum.customSize:
        return value ?? 0.0;
    }
  }
}
