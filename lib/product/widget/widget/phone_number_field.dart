// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:salonmake/product/constants/icon.dart';
import 'package:salonmake/product/core/base/base_state/base_state.dart';
import 'package:salonmake/product/util/util.dart';
import 'package:salonmake/product/validator/validator.dart';
import 'package:salonmake/product/widget/text_widget/body_medium.dart';

class PhoneNumberFieldWidget extends StatefulWidget {
  const PhoneNumberFieldWidget({
    super.key,
    required this.phoneNumberController,
    required this.hintText,
    required this.onChanged,
    required this.isLabelText,
  });

  final TextEditingController phoneNumberController;
  final String hintText;
  final void Function(String)? onChanged;
  final bool isLabelText;

  @override
  State<PhoneNumberFieldWidget> createState() => _PhoneNumberFieldWidgetState();
}

class _PhoneNumberFieldWidgetState extends BaseState<PhoneNumberFieldWidget> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // label text
        widget.isLabelText == true
            ? SizedBox(
                width: dynamicViewExtensions.maxWidth(context),
                child: Padding(
                  padding: BaseUtility.vertical(
                    BaseUtility.paddingNormalValue,
                  ),
                  child: BodyMediumBlackText(
                    text: widget.hintText,
                    textAlign: TextAlign.left,
                  ),
                ),
              )
            : const SizedBox(),
        // phone number field
        Container(
          margin: BaseUtility.bottom(BaseUtility.paddingSmallValue),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              BaseUtility.radiusCircularMediumValue,
            ),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: TextFormField(
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.scrim,
                  fontFamily: 'Nunito Regular',
                  fontWeight: FontWeight.bold,
                ),
            controller: widget.phoneNumberController,
            validator: (String? value) {
              final result = CustomValidator(value: value, context: context)
                  .phoneNumberValidator(value);
              setState(() {
                errorText = result;
              });
              return result;
            },
            onChanged: widget.onChanged,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              errorStyle: const TextStyle(
                fontSize: 0.2,
              ),
              prefixIcon: Padding(
                padding: BaseUtility.all(
                  BaseUtility.paddingNormalValue,
                ),
                child: AppIcons.callOutline.toSvgImg(
                  Colors.black,
                  BaseUtility.iconNormalSize,
                  BaseUtility.iconNormalSize,
                ),
              ),
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontFamily: 'Inter Regular',
                    fontWeight: FontWeight.w500,
                  ),
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
          ),
        ),
        // Validator error message
        if (errorText != null)
          Padding(
            padding: BaseUtility.all(BaseUtility.paddingMediumValue),
            child: Row(
              children: [
                AppIcons.solidWarning.toSvgImg(
                  Theme.of(context).colorScheme.error,
                  BaseUtility.iconSmallSize,
                  BaseUtility.iconSmallSize,
                ),
                Expanded(
                  child: Padding(
                    padding: BaseUtility.left(BaseUtility.paddingNormalValue),
                    child: BodyMediumRedText(
                      text: errorText!,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
