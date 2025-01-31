import 'package:flutter/material.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/validator/validator.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';

class DropDownSingleListMenuWidget extends StatefulWidget {
  final String? selectStatus;
  final Function(String?) onStatusChanged;
  final String text;
  final List<String> list;
  final bool statusValidator;
  final bool? isLabelText;

  const DropDownSingleListMenuWidget({
    super.key,
    required this.selectStatus,
    required this.onStatusChanged,
    required this.text,
    required this.list,
    required this.statusValidator,
    this.isLabelText,
  });
  @override
  State<DropDownSingleListMenuWidget> createState() =>
      _DropDownSingleListMenuWidgetState();
}

class _DropDownSingleListMenuWidgetState
    extends BaseState<DropDownSingleListMenuWidget> {
  String? _selectStatus;

  String? errorText;

  @override
  void initState() {
    super.initState();
    _selectStatus = widget.selectStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: BaseUtility.bottom(
        BaseUtility.paddingMediumValue,
      ),
      child: widget.isLabelText == null
          ? DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                isExpanded: true,
                hint: BodyMediumBlackText(
                  text: widget.text,
                  textAlign: TextAlign.center,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: BaseUtility.all(
                    BaseUtility.paddingNormalValue,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      BaseUtility.radiusCircularMediumValue,
                    ),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      BaseUtility.radiusCircularMediumValue,
                    ),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      BaseUtility.radiusCircularMediumValue,
                    ),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      BaseUtility.radiusCircularMediumValue,
                    ),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.error,
                      width: 1,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      BaseUtility.radiusCircularMediumValue,
                    ),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.error,
                      width: 1,
                    ),
                  ),
                ),
                icon: AppIcons.arrowDropDown.toSvgImg(
                  Theme.of(context).colorScheme.onSurface,
                  BaseUtility.iconMediumSize,
                  BaseUtility.iconMediumSize,
                ),
                value: _selectStatus,
                validator: (value) => widget.statusValidator == true
                    ? CustomValidator(value: value, context: context)
                        .emptyNormalCheck
                    : null,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectStatus = newValue;
                    _selectStatus = null;
                    errorText =
                        CustomValidator(value: newValue, context: context)
                            .emptyNormalCheck;
                  });
                  widget.onStatusChanged(newValue);
                },
                items:
                    widget.list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            )
          : Column(
              children: <Widget>[
                // label text

                SizedBox(
                  width: dynamicViewExtensions.maxWidth(context),
                  child: Padding(
                    padding:
                        BaseUtility.vertical(BaseUtility.paddingNormalValue),
                    child: BodyMediumBlackBoldText(
                      text: widget.text,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                // menu
                DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    hint: BodyMediumBlackText(
                      text: widget.text,
                      textAlign: TextAlign.center,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: BaseUtility.all(
                        BaseUtility.paddingNormalValue,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          BaseUtility.radiusCircularMediumValue,
                        ),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          BaseUtility.radiusCircularMediumValue,
                        ),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          BaseUtility.radiusCircularMediumValue,
                        ),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          BaseUtility.radiusCircularMediumValue,
                        ),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error,
                          width: 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          BaseUtility.radiusCircularMediumValue,
                        ),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error,
                          width: 1,
                        ),
                      ),
                    ),
                    icon: AppIcons.arrowDropDown.toSvgImg(
                      Theme.of(context).colorScheme.onSurface,
                      BaseUtility.iconMediumSize,
                      BaseUtility.iconMediumSize,
                    ),
                    value: _selectStatus,
                    validator: (value) => widget.statusValidator == true
                        ? CustomValidator(value: value, context: context)
                            .emptyNormalCheck
                        : null,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectStatus = newValue;
                        _selectStatus = null;
                        errorText =
                            CustomValidator(value: newValue, context: context)
                                .emptyNormalCheck;
                      });
                      widget.onStatusChanged(newValue);
                    },
                    items: widget.list
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
    );
  }
}
