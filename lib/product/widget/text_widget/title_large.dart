import 'package:flutter/material.dart';
import 'package:salonmake/product/theme/light_theme.dart';

class TitleLargeBlackBoldText extends StatelessWidget {
  const TitleLargeBlackBoldText({
    super.key,
    required this.text,
    required this.textAlign,
  });

  final String text;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: CustomLightTheme().themeData.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito Bold',
          ),
    );
  }
}

class TitleLargeBlackBoldSecondText extends StatelessWidget {
  const TitleLargeBlackBoldSecondText({
    super.key,
    required this.text,
    required this.textAlign,
  });

  final String text;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: text.split(' ').map((word) {
          if (word.toLowerCase() == 'freud') {
            // Eğer kelime "freud" ise mavi renkte göster
            return TextSpan(
              text: '$word ',
              style:
                  CustomLightTheme().themeData.textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito Bold',
                        color: Colors.blue, // Mavi renk
                      ),
            );
          } else {
            // Diğer kelimeler için varsayılan stil
            return TextSpan(
              text: '$word ',
              style:
                  CustomLightTheme().themeData.textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito Bold',
                      ),
            );
          }
        }).toList(),
      ),
    );
  }
}

class TitleLargeBlackText extends StatelessWidget {
  const TitleLargeBlackText({
    super.key,
    required this.text,
    required this.textAlign,
  });

  final String text;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: CustomLightTheme().themeData.textTheme.titleLarge!.copyWith(
            fontFamily: 'Nunito Bold',
          ),
    );
  }
}

class TitleLargeWhiteBoldText extends StatelessWidget {
  const TitleLargeWhiteBoldText({
    super.key,
    required this.text,
    required this.textAlign,
  });

  final String text;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: CustomLightTheme().themeData.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito Bold',
            color: Colors.white,
          ),
    );
  }
}

class TitleLargeMainColorBoldText extends StatelessWidget {
  const TitleLargeMainColorBoldText({
    super.key,
    required this.text,
    required this.textAlign,
  });

  final String text;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: CustomLightTheme().themeData.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito Bold',
            color: Theme.of(context).colorScheme.primary,
          ),
    );
  }
}
