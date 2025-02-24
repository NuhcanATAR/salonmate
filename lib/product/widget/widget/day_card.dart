import 'package:flutter/material.dart';
import 'package:salonmate/product/extension/dynamic_extension.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/text_widget/title_medium.dart';

class DayCardWidget extends StatelessWidget {
  const DayCardWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.onTap,
    required this.appointment,
    this.borderColor,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final Function() onTap;

  final Color? borderColor;
  final DateTime appointment;

  @override
  Widget build(BuildContext context) {
    String getDayName(DateTime date) {
      final Map<int, String> days = {
        1: 'PZT',
        2: 'SAL',
        3: 'ÇAR',
        4: 'PER',
        5: 'CUM',
        6: 'CMT',
        7: 'PZR',
      };

      return days[date.weekday] ?? 'N/A';
    }

    return Padding(
      padding: BaseUtility.right(
        BaseUtility.paddingNormalValue,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: dynamicViewExtensions.dynamicWidth(context, 0.18),
          child: Container(
            padding: BaseUtility.all(
              BaseUtility.paddingMediumValue,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: borderColor != null
                  ? Border.all(
                      color: borderColor!,
                      width: 0.5,
                    )
                  : null,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  BaseUtility.radiusCircularMediumValue,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // day
                TitleMediumBlackBoldText(
                  text: getDayName(appointment),
                  textAlign: TextAlign.center,
                ),
                // value
                Padding(
                  padding: BaseUtility.vertical(
                    BaseUtility.paddingNormalValue,
                  ),
                  child: BodyMediumBlackText(
                    text: appointment.day.toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
