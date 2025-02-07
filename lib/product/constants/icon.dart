import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AppIcons {
  accountOutline('account_outline'),
  account('account'),
  addAccount('add_account'),
  addCircleOutline('add_circle_outline'),
  arrowDropDown('arrow_drop_down'),
  arrowLeft('arrow_left'),
  calendarOutline('calendar_outline'),
  calendar('calendar'),
  check('check'),
  clockOutline('clock_outline'),
  clockTime('clock_time'),
  close('close'),
  deleteOutline('delete_outline'),
  favoriteOutline('favorite_outline'),
  favorite('favorite'),
  google('google'),
  group('group'),
  homeOutline('home_outline'),
  home('home'),
  imageIc('image_ic'),
  image('image'),
  locationFill('location'),
  locationOutline('location_outline'),
  locationMap('location_map'),
  minCalendar('min_calendar'),
  notification('notifications'),
  rectangle('rectangle'),
  search('search'),
  star('star'),
  tune('tune'),
  add('add'),
  duotoneEmail('duotone_email'),
  eyeOutline('eye_outline'),
  eyeCloseOutline('eyeclose_outline'),
  solidWarning('solid_warning'),
  superegoLock('superego_lock'),
  monotoneLock('monotone_lock'),
  callOutline('call_outline'),
  mark('mark'),
  markOutline('mark_outline'),
  mapOutline('map_outline'),
  arrowRight('arrow_right');

  final String value;
  const AppIcons(this.value);

  String get toSvg => "assets/icons/$value.svg";
  SvgPicture toSvgImg(
    Color? color,
    double width,
    double height,
  ) =>
      SvgPicture.asset(
        toSvg,
        color: color,
        width: width,
        height: height,
      );

  String get toPng => "assets/icons/$value.png";
  Image toPngImg(
    double width,
    double height,
  ) =>
      Image.asset(
        toPng,
        width: width,
        height: height,
      );
}
