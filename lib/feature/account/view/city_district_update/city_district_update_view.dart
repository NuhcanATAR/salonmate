import 'package:flutter/material.dart';
import 'package:salonmate/feature/account/view/city_district_update/city_district_update_viewmodel.dart';

class CityDistrictUpdateView extends StatefulWidget {
  const CityDistrictUpdateView({super.key});

  @override
  State<CityDistrictUpdateView> createState() => _CityDistrictUpdateViewState();
}

class _CityDistrictUpdateViewState extends CityDistrictUpdateViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Şehir ve İlçe Güncelle"),
      ),
    );
  }
}
