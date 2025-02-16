import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salonmate/feature/account/bloc/cubit.dart';
import 'package:salonmate/feature/account/bloc/event.dart';
import 'package:salonmate/feature/account/view/information_update/information_update_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';

abstract class InformationUpdateViewModel
    extends BaseState<InformationUpdateView> {
  final formInformationUpdateKey = GlobalKey<FormState>();

  late TextEditingController fullNameController = TextEditingController();
  late TextEditingController phoneNumberController = TextEditingController();
  late TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AccountBloc>().add(FetchAccountData(context: context));
    });
  }
}
