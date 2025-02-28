import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/sign_up/bloc/cubit.dart';
import 'package:salonmate/feature/sign_up/bloc/event.dart';
import 'package:salonmate/feature/sign_up/bloc/mixin.dart';
import 'package:salonmate/feature/sign_up/sign_up_view.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/core/base/helper/show_dialogs.dart';

abstract class SignUpViewmodel extends BaseState<SignUpView> with SignUpMixin {
  final formSignUpKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? selectedCity;
  String? selectedDistrict;

  void signUp() {
    if (formSignUpKey.currentState!.validate()) {
      if (selectedCity != null && selectedDistrict != null) {
        context.read<SignUpBloc>().add(
              SignUpFuncEvent(
                email: emailController.text,
                password: passwordController.text,
                fullName: fullNameController.text,
                phoneNumber: widget.phoneNumber,
                city: selectedCity!,
                district: selectedDistrict!,
                userName: userNameController.text,
                context: context,
              ),
            );
      } else {
        CodeNoahDialogs(context).showFlush(
          type: SnackType.error,
          message: AppLocalizations.of(context)!
              .sign_up_selected_city_district_error,
        );
      }
    }
  }

  void handleCityChanged(String? city) {
    setState(() {
      selectedCity = city;
      selectedDistrict = null;
    });
  }

  void handleDistrictChanged(String? district) {
    setState(() {
      selectedDistrict = district;
    });
  }
}
