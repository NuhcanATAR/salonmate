import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum AppImages {
  applePay('apple_pay'),
  googlePay('google_pay'),
  hairColor('hair_color'),
  hairCut('hair_cut'),
  hairStyle('hair_style'),
  masterPay('master_pay'),
  splashCover('splash_cover'),
  success('success'),
  topRated('top_rated'),
  visa('visa'),
  warning('warning'),
  google('google'),
  apple('apple'),
  failed('failed'),
  notfound('notfound'),
  locationPermissions('location_permission');

  final String value;
  const AppImages(this.value);

  String get toSvg => "assets/images/$value.svg";
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

  String get toPng => "assets/images/$value.png";
  Image toPngImg(
    double width,
    double height,
  ) =>
      Image.asset(
        toPng,
        width: width,
        height: height,
      );

  String get toJpg => "assets/images/$value.jpg";
  Image toJpgImg(
    double width,
    double height,
  ) =>
      Image.asset(
        toPng,
        width: width,
        height: height,
      );
}
