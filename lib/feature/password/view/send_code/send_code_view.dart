import 'package:flutter/material.dart';
import 'package:salonmate/feature/password/view/send_code/send_code_viewmodel.dart';
import 'package:salonmate/product/constants/color.dart';
import 'package:salonmate/product/constants/icon.dart';
import 'package:salonmate/product/core/base/helper/button_control.dart';
import 'package:salonmate/product/util/util.dart';
import 'package:salonmate/product/widget/text_widget/body_medium.dart';
import 'package:salonmate/product/widget/widget/button.dart';
import 'package:salonmate/product/widget/widget/phone_number_field.dart';
import 'package:salonmate/product/widget/widget/title_subtitle_widget.dart';

class PasswordSendCodeView extends StatefulWidget {
  const PasswordSendCodeView({super.key});

  @override
  State<PasswordSendCodeView> createState() => _PasswordSendCodeViewState();
}

class _PasswordSendCodeViewState extends PasswordSendCodeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: AppIcons.arrowLeft.toSvgImg(
            ColorConstant.dark2,
            BaseUtility.iconNormalSize,
            BaseUtility.iconNormalSize,
          ),
        ),
        title: const BodyMediumBlackBoldText(
          text: 'Send Code',
          textAlign: TextAlign.left,
        ),
      ),
      body: Form(
        key: formSendCodeKey,
        child: Padding(
          padding: BaseUtility.all(
            BaseUtility.paddingNormalValue,
          ),
          child: ListView(
            children: <Widget>[
              // title and sub title
              buildTitleSubTitleWidget,
              // phone number field
              buildPhoneNumberFieldWidget,
              // next button
              buildNextButtonWidget,
            ],
          ),
        ),
      ),
    );
  }

  // title and sub title
  Widget get buildTitleSubTitleWidget => TitleSubtitleWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        title: 'Telefon Numaranızı Giriniz 📞',
        subtitle:
            'Telefon Numaranızı giriniz size gelen kodu doğrulayınız ve şifrenizi yenileyiniz.',
      );

  // phone number field
  Widget get buildPhoneNumberFieldWidget => Padding(
        padding: BaseUtility.top(
          BaseUtility.paddingNormalValue,
        ),
        child: PhoneNumberFieldWidget(
          phoneNumberController: phoneNumberController,
          hintText: 'Phone Number',
          onChanged: (val) {},
          isLabelText: false,
        ),
      );

  // next button
  Widget get buildNextButtonWidget => CustomButtonWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        text: 'Send Code',
        func: passwordSendCode,
        btnStatus: ButtonTypes.primaryColorButton,
      );
}
