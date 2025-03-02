import 'package:flutter/material.dart';
import 'package:salonmate/product/core/base/helper/payment_type_control.dart';
import 'package:salonmate/product/core/base/helper/radio_size_control.dart';

class RadioFieldWidget extends StatelessWidget {
  const RadioFieldWidget({
    super.key,
    required this.isRadioSizeType,
    required this.value,
    required this.onChanged,
    this.customSize,
    required this.character,
    required this.selectValue,
  });

  final RadioSizeEnum isRadioSizeType;
  final bool value;
  final void Function(PaymentType? value) onChanged;
  final double? customSize;
  final PaymentType? character;
  final PaymentType selectValue;

  @override
  Widget build(BuildContext context) {
    return isRadioSizeType == RadioSizeEnum.smallSize
        ? Transform.scale(
            scale: RadioSizeEnum.smallSize.size(null),
            child: Radio<PaymentType>(
              value: selectValue,
              groupValue: character,
              onChanged: onChanged,
            ),
          )
        : isRadioSizeType == RadioSizeEnum.defaultSize
            ? Transform.scale(
                scale: RadioSizeEnum.defaultSize.size(null),
                child: Radio<PaymentType>(
                  value: selectValue,
                  groupValue: character,
                  onChanged: onChanged,
                ),
              )
            : isRadioSizeType == RadioSizeEnum.largeSize
                ? Transform.scale(
                    scale: RadioSizeEnum.largeSize.size(null),
                    child: Radio<PaymentType>(
                      value: selectValue,
                      groupValue: character,
                      onChanged: onChanged,
                    ),
                  )
                : isRadioSizeType == RadioSizeEnum.customSize
                    ? Transform.scale(
                        scale: customSize ?? 1.0,
                        child: Radio<PaymentType>(
                          value: selectValue,
                          groupValue: character,
                          onChanged: onChanged,
                        ),
                      )
                    : const SizedBox();
  }
}
