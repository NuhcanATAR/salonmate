import 'package:salonmate/feature/account/view/help_support/help_support_view.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';

abstract class HelpSupportViewModel extends BaseState<HelpSupportView> {
  late List<QuestionsModel> questions = [
    QuestionsModel(
      title: 'Şifremi Unuttum',
      category: 'Hesap',
      explanation:
          'Şifrenizi unutmanız durumunda şifre unuttum bölümünde hesabınızın şifresini telefon numaranızı girerek doğruluyabilirsiniz.',
    ),
    QuestionsModel(
      title: 'Hesap Kapatmak İstiyorum',
      category: 'Hesap',
      explanation:
          'Hesabınızı kapatmak istediğiniz durumlarda bizle sosyal medya veya e-mail ile iletişime geçebilirsiniz.',
    ),
    QuestionsModel(
      title: 'Randevu Oluşturma',
      category: 'Randevu',
      explanation:
          'Randevu oluşturma durumunuzda gitmediğiniz durumunda randevunuz için ödemeniz geri hesabınıza 1 ile 2 iş günü içinde geri yatar.',
    ),
  ];
}

class QuestionsModel {
  final String title;
  final String category;
  final String explanation;

  QuestionsModel({
    required this.title,
    required this.category,
    required this.explanation,
  });
}
