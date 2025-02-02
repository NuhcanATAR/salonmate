enum ButtonTypes {
  primaryColorButton,
  iconPrimaryColorButton,
  borderPrimaryColorButton,
  borderErrorColorButton,
  whiteColorIconButton,
  blackColorIconButton,
}

extension ButtonType on ButtonTypes {
  int get buttonTypeValue {
    switch (this) {
      case ButtonTypes.primaryColorButton:
        return 1;
      case ButtonTypes.iconPrimaryColorButton:
        return 2;
      case ButtonTypes.borderPrimaryColorButton:
        return 3;
      case ButtonTypes.borderErrorColorButton:
        return 4;
      case ButtonTypes.whiteColorIconButton:
        return 5;
      case ButtonTypes.blackColorIconButton:
        return 6;
    }
  }
}
