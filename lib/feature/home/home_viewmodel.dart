import 'package:flutter/material.dart';
import 'package:salonmate/feature/home/home_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';

abstract class HomeViewModel extends BaseState<HomeView> {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
}
