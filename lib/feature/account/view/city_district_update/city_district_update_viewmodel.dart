import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/account/bloc/cubit.dart';
import 'package:salonmate/feature/account/bloc/event.dart';
import 'package:salonmate/feature/account/bloc/mixin.dart';
import 'package:salonmate/feature/account/view/city_district_update/city_district_update_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/core/base/helper/show_dialogs.dart';

abstract class CityDistrictUpdateViewModel
    extends BaseState<CityDistrictUpdateView> with AccountMixin {
  final formCityDistrictUpdateKey = GlobalKey<FormState>();

  String? selectedCity = '';
  String? selectedDistrict = '';

  String? newCity;
  String? newDistrict;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AccountBloc>().add(FetchAccountDataEvent(context: context));
    });
  }

  void handleCityChanged(String? city) {
    setState(() {
      selectedCity = city;
      selectedDistrict = null;
      newCity = city;
      newDistrict = null;
    });
  }

  void handleDistrictChanged(String? district) {
    setState(() {
      selectedDistrict = district;
      newDistrict = district;
    });
  }

  Future<void> cityDistrictUpdate() async {
    final token = await getAuthToken();
    if (selectedCity != null && selectedDistrict != null) {
      if (newCity != null || newDistrict != null) {
        if (!mounted) return;
        context.read<AccountBloc>().add(
              AccountCityDistrictUpdateEvent(
                token: token,
                city: newCity!,
                district: newDistrict!,
              ),
            );
      } else {
        if (!mounted) return;
        await CodeNoahDialogs(context).showFlush(
          type: SnackType.error,
          message: 'Güncellemek için Farklı Şehir ve İlçe Seçimi yapınız.',
        );
      }
    } else {
      if (!mounted) return;
      await CodeNoahDialogs(context).showFlush(
        type: SnackType.error,
        message: 'Lütfen Şehir ve İlçe Seçimlerinizi yapınız.',
      );
    }
  }
}
