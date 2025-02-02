import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/core/service/city_district/city_district.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';

class LocationMenuWidget extends StatefulWidget {
  const LocationMenuWidget({
    super.key,
    required this.onCityChanged,
    required this.onDistrictChanged,
    this.selectedCity,
    this.selectedDistrict,
  });

  final ValueChanged<String?> onCityChanged;
  final ValueChanged<String?> onDistrictChanged;
  final String? selectedCity;
  final String? selectedDistrict;

  @override
  State<LocationMenuWidget> createState() => _LocationMenuWidgetState();
}

class _LocationMenuWidgetState extends BaseState<LocationMenuWidget> {
  Map<String, List<String>>? cityDistricts;
  String? selectCity;
  String? selectDistrict;

  @override
  void initState() {
    super.initState();
    selectCity = widget.selectedCity;
    selectDistrict = widget.selectedDistrict;

    getCityDistrictApi();
  }

  @override
  void didUpdateWidget(covariant LocationMenuWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.selectedCity != oldWidget.selectedCity) {
      setState(() {
        selectCity = widget.selectedCity;
        selectDistrict = null;
      });
    }

    if (widget.selectedDistrict != oldWidget.selectedDistrict) {
      setState(() {
        selectDistrict = widget.selectedDistrict;
      });
    }
  }

  Future<void> getCityDistrictApi() async {
    final serviceApi =
        CityDistrictService('https://turkiyeapi.dev/api/v1/provinces');
    try {
      final allCityDistrictsList = await serviceApi.fetchAllCityDistricts();
      setState(() {
        cityDistricts = allCityDistrictsList;
      });
    } catch (e) {
      Logger().e('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return cityDistricts != null
        ? Column(
            children: <Widget>[
              // city
              Column(
                children: <Widget>[
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding:
                          BaseUtility.vertical(BaseUtility.paddingNormalValue),
                      child: const BodyMediumBlackBoldText(
                        text: 'City',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                    padding: BaseUtility.horizontal(
                      BaseUtility.paddingMediumValue,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        BaseUtility.radiusCircularMediumValue,
                      ),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.black,
                          size: BaseUtility.iconNormalSize,
                        ),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: BaseUtility.paddingNormalValue,
                                vertical: BaseUtility.paddingSmallValue,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  BaseUtility.radiusCircularMediumValue,
                                ),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  BaseUtility.radiusCircularMediumValue,
                                ),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  BaseUtility.radiusCircularMediumValue,
                                ),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  BaseUtility.radiusCircularMediumValue,
                                ),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            icon: AppIcons.locationFill.toSvgImg(
                              Colors.black,
                              BaseUtility.iconNormalSize,
                              BaseUtility.iconNormalSize,
                            ),
                            value: selectCity,
                            onChanged: (String? value) {
                              setState(() {
                                selectCity = value;
                                selectDistrict = null;
                              });
                              widget.onCityChanged(value);
                            },
                            items: cityDistricts?.keys.map((String city) {
                              return DropdownMenuItem<String>(
                                value: city,
                                child: BodyMediumBlackBoldText(
                                  text: city,
                                  textAlign: TextAlign.left,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // district
              Column(
                children: <Widget>[
                  SizedBox(
                    width: dynamicViewExtensions.maxWidth(context),
                    child: Padding(
                      padding:
                          BaseUtility.vertical(BaseUtility.paddingNormalValue),
                      child: const BodyMediumBlackBoldText(
                        text: 'District',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                    padding: BaseUtility.horizontal(
                      BaseUtility.paddingMediumValue,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        BaseUtility.radiusCircularMediumValue,
                      ),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.black,
                          size: BaseUtility.iconNormalSize,
                        ),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: BaseUtility.paddingNormalValue,
                                vertical: BaseUtility.paddingSmallValue,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  BaseUtility.radiusCircularMediumValue,
                                ),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  BaseUtility.radiusCircularMediumValue,
                                ),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  BaseUtility.radiusCircularMediumValue,
                                ),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  BaseUtility.radiusCircularMediumValue,
                                ),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            icon: AppIcons.locationFill.toSvgImg(
                              Colors.black,
                              BaseUtility.iconNormalSize,
                              BaseUtility.iconNormalSize,
                            ),
                            value: selectDistrict,
                            onChanged: (String? value) {
                              setState(() {
                                selectDistrict = value;
                              });
                              widget.onDistrictChanged(value);
                            },
                            items: selectCity == null
                                ? []
                                : cityDistricts![selectCity]!
                                    .map((String district) {
                                    return DropdownMenuItem<String>(
                                      value: district,
                                      child: BodyMediumBlackBoldText(
                                        text: district,
                                        textAlign: TextAlign.left,
                                      ),
                                    );
                                  }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        : const SizedBox();
  }
}

class MainUserCityModel {
  final String cityName;
  final List<MainUserDistrict> subDistrictList;

  MainUserCityModel(this.cityName, this.subDistrictList);
}

class MainUserDistrict {
  final String districtName;

  MainUserDistrict(this.districtName);
}
