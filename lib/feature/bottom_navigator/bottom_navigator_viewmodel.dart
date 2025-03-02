import 'package:flutter/material.dart';
import 'package:salonmate/feature/account/account_view.dart';
import 'package:salonmate/feature/appointments/appointments_view.dart';
import 'package:salonmate/feature/bottom_navigator/bottom_navigator_view.dart';
import 'package:salonmate/feature/favorite/favorite_view.dart';
import 'package:salonmate/feature/home/home_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/mixin/navbar_mixin.dart';

abstract class BottomNavigatorViewModel extends BaseState<BottomNavigatorView>
    with BottomMenuMixin {
  List<Widget> viewList = <Widget>[
    const HomeView(),
    const AppointmentsView(),
    const FavoriteView(),
    const AccountView(),
  ];

  late int selectView = 0;

  // menu ontap
  void menuClickChange(int viewValue) {
    setState(() {
      selectView = viewValue;
    });
  }
}
