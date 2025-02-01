import 'package:flutter/material.dart';
import 'package:salonmate/feature/sign_up/sign_up_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';

abstract class SignUpViewmodel extends BaseState<SignUpView> {
  final formSignUpKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? selectedCity;
  String? selectedDistrict;

  void signUp() {
    if (formSignUpKey.currentState!.validate()) {}
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
