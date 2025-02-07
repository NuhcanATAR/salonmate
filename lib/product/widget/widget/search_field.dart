import 'package:flutter/material.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/util/util.dart';

class CustomSearchFieldWidget extends StatelessWidget {
  const CustomSearchFieldWidget({
    super.key,
    required this.onChanged,
    required this.controller,
    required this.hintText,
  });

  final Function(String) onChanged;
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: BaseUtility.horizontal(BaseUtility.paddingNormalValue),
      margin: BaseUtility.bottom(BaseUtility.paddingSmallValue),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(
          BaseUtility.radiusCircularMediumValue,
        ),
      ),
      child: TextFormField(
        controller: controller,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.scrim,
              fontFamily: 'Inter Regular',
              fontWeight: FontWeight.bold,
            ),
        onChanged: onChanged,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          errorStyle: const TextStyle(
            fontSize: 0.2,
          ),
          hintText: hintText,
          icon: AppIcons.search.toSvgImg(
            Colors.black54,
            BaseUtility.iconNormalSize,
            BaseUtility.iconNormalSize,
          ),
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
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
    );
  }
}
