import 'package:flutter/material.dart';
import 'package:salonmate/product/constants/color.dart';

final class CustomColorScheme {
  CustomColorScheme._();

  static ColorScheme lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: ColorConstant.primaryColor,
    surfaceTint: Color(0xff39693b),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xffbaf0b7),
    onPrimaryContainer: Color(0xff002106),
    secondary: Color(0xFF2C426A),
    onSecondary: Color(0xFF6FADFF),
    secondaryContainer: Color(0xffd5e8d0),
    onSecondaryContainer: Color.fromARGB(94, 159, 199, 150),
    tertiary: Color(0xff39656b),
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xffbcebf2),
    onTertiaryContainer: Color(0xff001f23),
    error: ColorConstant.error,
    onError: ColorConstant.warning,
    errorContainer: Color(0xffffdad6),
    onErrorContainer: Color(0xff410002),
    surface: Color(0xFFCED4DA),
    onSurface: Color(0xFF343A40),
    surfaceContainerHighest: Color.fromARGB(250, 250, 250, 250),
    onSurfaceVariant: Color(0xff424940),
    outline: ColorConstant.gray,
    outlineVariant: Color(0xffc2c9bd),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xff2d322c),
    inversePrimary: Color.fromARGB(255, 82, 191, 102),
  );
}
