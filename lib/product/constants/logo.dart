import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AppLogoConstants {
  logoText('logo_text');

  final String value;

  const AppLogoConstants(this.value);

  String get toPng => "assets/logo/$value.png";

  Image toImg(
    double? width,
    double? height,
  ) =>
      Image.asset(
        toPng,
        width: width,
        height: height,
      );

  String get toSvg => "assets/logo/$value.svg";
  SvgPicture toSvgImg(
    Color? color,
    double? width,
    double? height,
  ) =>
      SvgPicture.asset(
        toSvg,
        color: color,
        width: width,
        height: height,
      );
}
