import 'package:salonmate/feature/account/view/help_support/help_support_view.dart';
import 'package:salonmate/lang/app_localizations.dart';
import 'package:salonmate/product/core/base/base_state/base_state.dart';

abstract class HelpSupportViewModel extends BaseState<HelpSupportView> {
  late List<QuestionsModel> questions = [
    QuestionsModel(
      title:
          AppLocalizations.of(context)!.account_help_support_question_one_title,
      category: AppLocalizations.of(context)!
          .account_help_support_question_one_category,
      explanation: AppLocalizations.of(context)!
          .account_help_support_question_one_explanation,
    ),
    QuestionsModel(
      title: AppLocalizations.of(context)!
          .account_help_support_question_second_title,
      category: AppLocalizations.of(context)!
          .account_help_support_question_second_category,
      explanation: AppLocalizations.of(context)!
          .account_help_support_question_second_explanation,
    ),
    QuestionsModel(
      title: AppLocalizations.of(context)!
          .account_help_support_question_three_title,
      category: AppLocalizations.of(context)!
          .account_help_support_question_three_category,
      explanation: AppLocalizations.of(context)!
          .account_help_support_question_three_explanation,
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
