import 'package:flutter/material.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/validator/validator.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';

class CustomPasswordFieldWidget extends StatefulWidget {
  const CustomPasswordFieldWidget({
    super.key,
    required this.passwordController,
    required this.hintText,
    required this.onChanged,
    required this.isValidator,
    required this.isLabelText,
  });

  final TextEditingController passwordController;
  final String hintText;
  final Function(String)? onChanged;
  final bool isValidator;
  final bool isLabelText;

  @override
  State<CustomPasswordFieldWidget> createState() =>
      _CustomPasswordFieldWidgetState();
}

class _CustomPasswordFieldWidgetState
    extends BaseState<CustomPasswordFieldWidget> {
  String? errorText;
  bool isPassObscured = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // label text
        buildLabelTextWidget,
        // password field
        buildPasswordFieldWidget,
        // validator error
        if (errorText != null) buildValidatorErrorWidget,
      ],
    );
  }

  // label text
  Widget get buildLabelTextWidget => widget.isLabelText == true
      ? SizedBox(
          width: dynamicViewExtensions.maxWidth(context),
          child: Padding(
            padding: BaseUtility.vertical(
              BaseUtility.paddingNormalValue,
            ),
            child: BodyMediumBlackBoldText(
              text: widget.hintText,
              textAlign: TextAlign.left,
            ),
          ),
        )
      : const SizedBox();

  // password field
  Widget get buildPasswordFieldWidget => Container(
        padding: BaseUtility.horizontal(
          BaseUtility.paddingNormalValue,
        ),
        margin: widget.isLabelText == true
            ? const EdgeInsets.only(
                bottom: BaseUtility.marginNormalValue,
              )
            : BaseUtility.bottom(BaseUtility.paddingSmallValue),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            BaseUtility.radiusCircularMediumValue,
          ),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: TextFormField(
          obscureText: isPassObscured,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.scrim,
                fontWeight: FontWeight.bold,
              ),
          controller: widget.passwordController,
          validator: (String? value) {
            final result = widget.isValidator == true
                ? CustomValidator(value: value, context: context).passwordCheck
                : CustomValidator(value: value, context: context)
                    .emptyNormalCheck;
            setState(() {
              errorText = result;
            });
            return result;
          },
          onChanged: (value) {
            setState(() {
              errorText = null;
            });
            widget.onChanged?.call(value);
          },
          decoration: InputDecoration(
            errorStyle: const TextStyle(
              fontSize: 0.2,
            ),
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isPassObscured = !isPassObscured;
                });
              },
              icon: isPassObscured == true
                  ? AppIcons.eyeOutline.toSvgImg(
                      Colors.blueGrey,
                      BaseUtility.iconNormalSize,
                      BaseUtility.iconNormalSize,
                    )
                  : AppIcons.eyeCloseOutline.toSvgImg(
                      Colors.blueGrey,
                      BaseUtility.iconNormalSize,
                      BaseUtility.iconNormalSize,
                    ),
            ),
            icon: AppIcons.monotoneLock.toSvgImg(
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
            // TextFormField varsayılan hata mesajını engellemek için errorText kullanma
            errorText: null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                BaseUtility.radiusCircularMediumValue,
              ),
              borderSide: const BorderSide(
                color: Colors.transparent,
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
      );

  // validator error
  Widget get buildValidatorErrorWidget => Padding(
        padding: BaseUtility.all(
          BaseUtility.paddingMediumValue,
        ),
        child: Row(
          children: [
            AppIcons.solidWarning.toSvgImg(
              Theme.of(context).colorScheme.error,
              BaseUtility.iconSmallSize,
              BaseUtility.iconSmallSize,
            ),
            Expanded(
              child: Padding(
                padding: BaseUtility.left(
                  BaseUtility.paddingNormalValue,
                ),
                child: BodyMediumRedText(
                  text: errorText!,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      );
}
