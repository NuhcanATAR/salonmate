import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonmate/feature/account/bloc/cubit.dart';
import 'package:salonmate/feature/account/bloc/state.dart';
import 'package:salonmate/feature/account/view/city_district_update/city_district_update_viewmodel.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/widget/button.dart';

import '../../../../product/widget/widget/location_menu.dart';

class CityDistrictUpdateView extends StatefulWidget {
  const CityDistrictUpdateView({super.key});

  @override
  State<CityDistrictUpdateView> createState() => _CityDistrictUpdateViewState();
}

class _CityDistrictUpdateViewState extends CityDistrictUpdateViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        backgroundColor: ColorConstant.appBarColor,
        surfaceTintColor: ColorConstant.appBarColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: AppIcons.arrowLeft.toSvgImg(
            Colors.black54,
            BaseUtility.iconNormalSize,
            BaseUtility.iconNormalSize,
          ),
        ),
        centerTitle: true,
        title: const BodyMediumBlackText(
          text: 'Şehir ve İlçe Bilgisi Güncelle',
          textAlign: TextAlign.left,
        ),
      ),
      body: BlocConsumer<AccountBloc, AccountState>(
        listener: accountCityDistrictUpdateListenerBloc,
        builder: (context, state) {
          return BlocBuilder<AccountBloc, AccountState>(
            builder: (context, state) {
              if (state is AccountLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is AccountLoaded) {
                selectedCity = state.city;
                selectedDistrict = state.district;
                return buildBodyWidget;
              } else if (state is AccountError) {
                return const SizedBox();
              }
              return const SizedBox();
            },
          );
        },
      ),
    );
  }

  // body
  Widget get buildBodyWidget => Form(
        key: formCityDistrictUpdateKey,
        child: Padding(
          padding: BaseUtility.all(
            BaseUtility.paddingNormalValue,
          ),
          child: ListView(
            children: <Widget>[
              // city district
              Padding(
                padding: BaseUtility.bottom(
                  BaseUtility.paddingNormalValue,
                ),
                child: LocationMenuWidget(
                  onCityChanged: handleCityChanged,
                  onDistrictChanged: handleDistrictChanged,
                  selectedCity: selectedCity,
                  selectedDistrict: selectedDistrict,
                ),
              ),
              // save button
              CustomButtonWidget(
                dynamicViewExtensions: dynamicViewExtensions,
                text: 'UPDATE',
                func: cityDistrictUpdate,
                btnStatus: ButtonTypes.primaryColorButton,
              ),
            ],
          ),
        ),
      );
}
