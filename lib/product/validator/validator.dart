import 'package:flutter/material.dart';
import 'package:salonmate/lang/app_localizations.dart';

final class CustomValidator {
  CustomValidator({required this.value, required this.context});

  final String? value;
  final BuildContext context;
  // integer control
  bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  // regexp
  final phoneNumberRegExp = RegExp(r"^[1-9][0-9]{9}$");
  final emailRegExp =
      RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");

  String? get emptyNumberCheck {
    // just number
    if (value == null || value!.isEmpty) {
      return AppLocalizations.of(context)!.validator_required_field;
    } else if (!isNumeric(value)) {
      return AppLocalizations.of(context)!.validator_invalid_error;
    }
    return null;
  }

  String? get emptyNormalCheck {
    // just string
    if (value == null || value!.isEmpty) {
      return AppLocalizations.of(context)!.validator_required_field;
    } else if (isNumeric(value) == true) {
      return AppLocalizations.of(context)!.validator_invalid_error;
    }
    return null;
  }

  String? get emptyNotNumberNormalCheck {
    // just string
    if (value == null || value!.isEmpty) {
      return AppLocalizations.of(context)!.validator_required_field;
    }
    return null;
  }

  String? get emailCheck {
    if (value == null || value!.isEmpty) {
      return AppLocalizations.of(context)!.validator_email_empty_error;
    } else if (!emailRegExp.hasMatch(value!)) {
      return AppLocalizations.of(context)!.validator_email_invalid_error;
    } else {
      return null;
    }
  }

  String? get passwordCheck {
    if (value == null || value!.isEmpty) {
      return AppLocalizations.of(context)!.validator_password_empty;
    } else if (value!.length < 8) {
      return AppLocalizations.of(context)!.validator_password_min_length;
    } else if (!value!.contains(RegExp(r'[A-Z]'))) {
      return AppLocalizations.of(context)!.validator_password_uppercase;
    } else if (!value!.contains(RegExp(r'[a-z]'))) {
      return AppLocalizations.of(context)!.validator_password_lowercase;
    } else if (!value!.contains(RegExp(r'[0-9]'))) {
      return AppLocalizations.of(context)!.validator_password_number;
    } else if (!value!.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return AppLocalizations.of(context)!.validator_password_special_character;
    } else {
      return null;
    }
  }

  String? phoneNumberValidator(String? phoneNumberVal) {
    if (phoneNumberVal == null || phoneNumberVal.isEmpty) {
      return AppLocalizations.of(context)!.validator_required_field;
    } else if (!isNumeric(phoneNumberVal)) {
      return AppLocalizations.of(context)!.validator_phone_invalid_error;
    } else if (!phoneNumberRegExp.hasMatch(phoneNumberVal)) {
      return AppLocalizations.of(context)!.validator_phone_invalid_error;
    } else {
      return null;
    }
  }
}
