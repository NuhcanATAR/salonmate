import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/home/bloc/cubit.dart';
import 'package:salonmate/feature/home/bloc/event.dart';
import 'package:salonmate/feature/home/home_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/core/base/helper/shared_keys.dart';

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
    } else {
      loggerPrint.printErrorLog('Token not available');
    }
  }

  Future<String> getAuthToken() async {
    return await prefService.getString(SharedKeys.token) ?? '';
  }
}
