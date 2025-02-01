import 'package:flutter/material.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/validator/validator.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';

class CustomEmailFieldWidget extends StatefulWidget {
  const CustomEmailFieldWidget({
    super.key,
    required this.emailController,
    required this.hintText,
    required this.onChanged,
    required this.isLabelText,
  });

  final TextEditingController emailController;
  final String hintText;
  final Function(String)? onChanged;
  final bool isLabelText;

  @override
  State<CustomEmailFieldWidget> createState() => _CustomEmailFieldWidgetState();
}

class _CustomEmailFieldWidgetState extends BaseState<CustomEmailFieldWidget> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // email field
        if (widget.isLabelText)
          SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            child: Padding(
              padding: BaseUtility.vertical(BaseUtility.paddingNormalValue),
              child: BodyMediumBlackBoldText(
                text: widget.hintText,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        Container(
          padding: BaseUtility.horizontal(BaseUtility.paddingNormalValue),
          margin: widget.isLabelText
              ? const EdgeInsets.only(bottom: BaseUtility.marginNormalValue)
              : BaseUtility.bottom(BaseUtility.paddingSmallValue),
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
                  fontFamily: 'Inter Regular',
                  fontWeight: FontWeight.bold,
                ),
            controller: widget.emailController,
            validator: (String? value) {
              final result =
                  CustomValidator(value: value, context: context).emailCheck;
              setState(() {
                errorText = result;
              });
              return result;
            },
            onChanged: widget.onChanged,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              errorStyle: const TextStyle(
                fontSize: 0.2,
              ),
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
              icon: AppIcons.duotoneEmail.toSvgImg(
                Colors.black,
                BaseUtility.iconNormalSize,
                BaseUtility.iconNormalSize,
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

        // validator error
        if (errorText != null)
          Padding(
            padding: BaseUtility.all(BaseUtility.paddingMediumValue),
            child: Row(
              children: [
                AppIcons.solidWarning.toSvgImg(
                  Colors.red,
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
