import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salonmate/feature/home/bloc/cubit.dart';
import 'package:salonmate/feature/home/bloc/event.dart';
import 'package:salonmate/feature/home/home_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/provider/user_provider.dart';

abstract class HomeViewModel extends BaseState<HomeView> {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    loadHomeData();
  }

  Future<void> loadHomeData() async {
    final token = await getAuthToken();
    if (token.isNotEmpty) {
      if (!mounted) return;
      context.read<HomeBloc>().add(HomeLoadEvent(token));
      await Provider.of<UserProvider>(context, listen: false)
          .fetchUserData(token);
    } else {
      loggerPrint.printErrorLog('Token not available');
    }
  }
}
