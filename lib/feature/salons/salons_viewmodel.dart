import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salonmate/feature/salons/bloc/cubit.dart';
import 'package:salonmate/feature/salons/bloc/event.dart';
import 'package:salonmate/feature/salons/salons_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';

abstract class SalonsViewModel extends BaseState<SalonsView> {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    loadSalonsData();
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  Future<void> loadSalonsData() async {
    final token = await getAuthToken();
    if (token.isNotEmpty) {
      if (!mounted) return;
      context.read<SalonsBloc>().add(SalonsLoadEvent(token: token));
    } else {
      loggerPrint.printErrorLog('Token not available');
    }
  }
}
