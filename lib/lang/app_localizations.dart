import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @account_token_not_avaible.
  ///
  /// In en, this message translates to:
  /// **'Token Not Available'**
  String get account_token_not_avaible;

  /// No description provided for @account_update_success.
  ///
  /// In en, this message translates to:
  /// **'User Information Successfully Updated.'**
  String get account_update_success;

  /// No description provided for @account_update_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred, please try again later.'**
  String get account_update_error;

  /// No description provided for @account_loading_text.
  ///
  /// In en, this message translates to:
  /// **'Please Wait...'**
  String get account_loading_text;

  /// No description provided for @account_appbar.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get account_appbar;

  /// No description provided for @account_unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get account_unknown;

  /// No description provided for @account_menu_group_title.
  ///
  /// In en, this message translates to:
  /// **'Account Management'**
  String get account_menu_group_title;

  /// No description provided for @account_information_update_menu.
  ///
  /// In en, this message translates to:
  /// **'Update Information'**
  String get account_information_update_menu;

  /// No description provided for @account_city_district_update_menu.
  ///
  /// In en, this message translates to:
  /// **'Update City and District Information'**
  String get account_city_district_update_menu;

  /// No description provided for @account_menu_group_application_setting_title.
  ///
  /// In en, this message translates to:
  /// **'Application Settings'**
  String get account_menu_group_application_setting_title;

  /// No description provided for @account_language_menu.
  ///
  /// In en, this message translates to:
  /// **'Language Selection'**
  String get account_language_menu;

  /// No description provided for @account_application_setting_menu.
  ///
  /// In en, this message translates to:
  /// **'Application Settings'**
  String get account_application_setting_menu;

  /// No description provided for @account_help_support_menu.
  ///
  /// In en, this message translates to:
  /// **'Help and Support'**
  String get account_help_support_menu;

  /// No description provided for @account_setting_menu_group_title.
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get account_setting_menu_group_title;

  /// No description provided for @account_create_menu.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get account_create_menu;

  /// No description provided for @account_exit_menu.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get account_exit_menu;

  /// No description provided for @account_city_district_update_appbar.
  ///
  /// In en, this message translates to:
  /// **'Update City and District Information'**
  String get account_city_district_update_appbar;

  /// No description provided for @account_city_district_update_button.
  ///
  /// In en, this message translates to:
  /// **'UPDATE'**
  String get account_city_district_update_button;

  /// No description provided for @accont_city_menu.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get accont_city_menu;

  /// No description provided for @account_district_menu.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get account_district_menu;

  /// No description provided for @account_select_city_district_error.
  ///
  /// In en, this message translates to:
  /// **'Please select a different city and district to update.'**
  String get account_select_city_district_error;

  /// No description provided for @account_select_city_district_secondary_error.
  ///
  /// In en, this message translates to:
  /// **'Please select your city and district.'**
  String get account_select_city_district_secondary_error;

  /// No description provided for @account_help_support_appbar.
  ///
  /// In en, this message translates to:
  /// **'Help and Support'**
  String get account_help_support_appbar;

  /// No description provided for @account_help_support_question_one_title.
  ///
  /// In en, this message translates to:
  /// **'Forgot My Password'**
  String get account_help_support_question_one_title;

  /// No description provided for @account_help_support_question_one_category.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account_help_support_question_one_category;

  /// No description provided for @account_help_support_question_one_explanation.
  ///
  /// In en, this message translates to:
  /// **'If you forget your password, you can verify your account password by entering your phone number in the forgot password section.'**
  String get account_help_support_question_one_explanation;

  /// No description provided for @account_help_support_question_second_title.
  ///
  /// In en, this message translates to:
  /// **'I Want to Close My Account'**
  String get account_help_support_question_second_title;

  /// No description provided for @account_help_support_question_second_category.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account_help_support_question_second_category;

  /// No description provided for @account_help_support_question_second_explanation.
  ///
  /// In en, this message translates to:
  /// **'If you want to close your account, you can contact us via social media or email.'**
  String get account_help_support_question_second_explanation;

  /// No description provided for @account_help_support_question_three_title.
  ///
  /// In en, this message translates to:
  /// **'Appointment Creation'**
  String get account_help_support_question_three_title;

  /// No description provided for @account_help_support_question_three_category.
  ///
  /// In en, this message translates to:
  /// **'Appointment'**
  String get account_help_support_question_three_category;

  /// No description provided for @account_help_support_question_three_explanation.
  ///
  /// In en, this message translates to:
  /// **'If you do not attend your appointment, your payment will be refunded to your account within 1 to 2 business days.'**
  String get account_help_support_question_three_explanation;

  /// No description provided for @account_information_update_appbar.
  ///
  /// In en, this message translates to:
  /// **'Update Information'**
  String get account_information_update_appbar;

  /// No description provided for @account_information_update_fullname.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get account_information_update_fullname;

  /// No description provided for @account_information_update_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get account_information_update_phone_number;

  /// No description provided for @account_information_update_address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get account_information_update_address;

  /// No description provided for @account_information_update_button.
  ///
  /// In en, this message translates to:
  /// **'UPDATE'**
  String get account_information_update_button;

  /// No description provided for @account_localization_select_appbar.
  ///
  /// In en, this message translates to:
  /// **'Language Selection'**
  String get account_localization_select_appbar;

  /// No description provided for @account_localization_select_turkish_menu.
  ///
  /// In en, this message translates to:
  /// **'Turkish'**
  String get account_localization_select_turkish_menu;

  /// No description provided for @account_localization_select_english_menu.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get account_localization_select_english_menu;

  /// No description provided for @account_localization_select_germany_menu.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get account_localization_select_germany_menu;

  /// No description provided for @appointment_appbar.
  ///
  /// In en, this message translates to:
  /// **'Appointments'**
  String get appointment_appbar;

  /// No description provided for @appointment_not_found_title.
  ///
  /// In en, this message translates to:
  /// **'No Appointments Found'**
  String get appointment_not_found_title;

  /// No description provided for @appointment_not_found_sub_title.
  ///
  /// In en, this message translates to:
  /// **'You have not created an appointment yet. You can start creating an appointment if you wish.'**
  String get appointment_not_found_sub_title;

  /// No description provided for @appointment_token_not_avaible.
  ///
  /// In en, this message translates to:
  /// **'Token Not Available'**
  String get appointment_token_not_avaible;

  /// No description provided for @appointment_stylist_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while loading stylists, please try again later.'**
  String get appointment_stylist_error;

  /// No description provided for @appointment_date_error.
  ///
  /// In en, this message translates to:
  /// **'No Appointment Found'**
  String get appointment_date_error;

  /// No description provided for @appointment_date_second_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred, please try again later.'**
  String get appointment_date_second_error;

  /// No description provided for @appointment_summary_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while retrieving salon information, please try again later.'**
  String get appointment_summary_error;

  /// No description provided for @appointment_summary_second_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred, please try again later.'**
  String get appointment_summary_second_error;

  /// No description provided for @appointment_summary_catch_error.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred'**
  String get appointment_summary_catch_error;

  /// No description provided for @appointmnet_create_success.
  ///
  /// In en, this message translates to:
  /// **'Your appointment has been successfully created. You can track your appointment in the appointments section.'**
  String get appointmnet_create_success;

  /// No description provided for @appointment_create_error.
  ///
  /// In en, this message translates to:
  /// **'Your appointment date has already been taken. Please select another date and time.'**
  String get appointment_create_error;

  /// No description provided for @appointment_create_second_error.
  ///
  /// In en, this message translates to:
  /// **'Your appointment could not be created, please try again later.'**
  String get appointment_create_second_error;

  /// No description provided for @appointment_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred, please try again later.'**
  String get appointment_error;

  /// No description provided for @appointment_second_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred, please try again later.'**
  String get appointment_second_error;

  /// No description provided for @appointment_update_success.
  ///
  /// In en, this message translates to:
  /// **'Your appointment has been successfully updated.'**
  String get appointment_update_success;

  /// No description provided for @apppointment_update_error.
  ///
  /// In en, this message translates to:
  /// **'There was an issue sending your appointment status, please try again later.'**
  String get apppointment_update_error;

  /// No description provided for @appointment_evaluation_success.
  ///
  /// In en, this message translates to:
  /// **'Your review has been submitted. Thank you!'**
  String get appointment_evaluation_success;

  /// No description provided for @appointment_evaluation_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred during the evaluation process, please try again later.'**
  String get appointment_evaluation_error;

  /// No description provided for @appointment_detail_appbar.
  ///
  /// In en, this message translates to:
  /// **'Appointment Detail'**
  String get appointment_detail_appbar;

  /// No description provided for @appointment_detail_payment_type.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get appointment_detail_payment_type;

  /// No description provided for @appointment_detail_pricing_details.
  ///
  /// In en, this message translates to:
  /// **'Payment Details'**
  String get appointment_detail_pricing_details;

  /// No description provided for @appointment_detail_total.
  ///
  /// In en, this message translates to:
  /// **'TOTAL'**
  String get appointment_detail_total;

  /// No description provided for @appointment_detail_evaluation_button.
  ///
  /// In en, this message translates to:
  /// **'Evaluate Appointment'**
  String get appointment_detail_evaluation_button;

  /// No description provided for @appointmnet_detail_token_not_avaible.
  ///
  /// In en, this message translates to:
  /// **'Token Not Available'**
  String get appointmnet_detail_token_not_avaible;

  /// No description provided for @appointment_detail_evaluation_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Evaluate Your Appointment!'**
  String get appointment_detail_evaluation_dialog_title;

  /// No description provided for @appointment_detail_evaluation_dialog_sub_title.
  ///
  /// In en, this message translates to:
  /// **'Rate your appointment and share your experience.'**
  String get appointment_detail_evaluation_dialog_sub_title;

  /// No description provided for @appointment_detail_evaluation_dialog_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get appointment_detail_evaluation_dialog_description;

  /// No description provided for @appointment_detail_evaluation_dialog_close_button.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get appointment_detail_evaluation_dialog_close_button;

  /// No description provided for @appointment_detail_evaluation_dialog_send_button.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get appointment_detail_evaluation_dialog_send_button;

  /// No description provided for @appointment_summary_appbar.
  ///
  /// In en, this message translates to:
  /// **'Appointment Summary'**
  String get appointment_summary_appbar;

  /// No description provided for @appointment_summary_loading_title.
  ///
  /// In en, this message translates to:
  /// **'Loading Appointment Summary'**
  String get appointment_summary_loading_title;

  /// No description provided for @appointment_summary_loading_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Please Wait...'**
  String get appointment_summary_loading_subtitle;

  /// No description provided for @appointment_summary_error_title.
  ///
  /// In en, this message translates to:
  /// **'An Error Occurred'**
  String get appointment_summary_error_title;

  /// No description provided for @appointment_summary_add_services_title.
  ///
  /// In en, this message translates to:
  /// **'Additional Services'**
  String get appointment_summary_add_services_title;

  /// No description provided for @appointment_summary_date_title.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get appointment_summary_date_title;

  /// No description provided for @appointment_summary_stylist_title.
  ///
  /// In en, this message translates to:
  /// **'Stylist'**
  String get appointment_summary_stylist_title;

  /// No description provided for @appointment_summary_stylist_date_mins.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get appointment_summary_stylist_date_mins;

  /// No description provided for @appointmnet_summary_payment_online_title.
  ///
  /// In en, this message translates to:
  /// **'Pay Online'**
  String get appointmnet_summary_payment_online_title;

  /// No description provided for @appointment_summary_payment_online_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Secure your booking instantly'**
  String get appointment_summary_payment_online_subtitle;

  /// No description provided for @appointment_summary_payment_at_salon_title.
  ///
  /// In en, this message translates to:
  /// **'Pay At Salon'**
  String get appointment_summary_payment_at_salon_title;

  /// No description provided for @appointment_summary_payment_at_salon_sub_title.
  ///
  /// In en, this message translates to:
  /// **'Settle payment after your appointment'**
  String get appointment_summary_payment_at_salon_sub_title;

  /// No description provided for @appointment_summary_pricing_details.
  ///
  /// In en, this message translates to:
  /// **'Pricing Details'**
  String get appointment_summary_pricing_details;

  /// No description provided for @appointment_summary_pricing_details_total.
  ///
  /// In en, this message translates to:
  /// **'TOTAL'**
  String get appointment_summary_pricing_details_total;

  /// No description provided for @appointment_summary_create_button.
  ///
  /// In en, this message translates to:
  /// **'Create Appointment'**
  String get appointment_summary_create_button;

  /// No description provided for @appointment_summary_token_not_avaible.
  ///
  /// In en, this message translates to:
  /// **'Token Not Available'**
  String get appointment_summary_token_not_avaible;

  /// No description provided for @appointment_receipt_appbar.
  ///
  /// In en, this message translates to:
  /// **'Receipt'**
  String get appointment_receipt_appbar;

  /// No description provided for @appointment_receipt_success_title.
  ///
  /// In en, this message translates to:
  /// **'Your Appointment Has Been Successfully Created!'**
  String get appointment_receipt_success_title;

  /// No description provided for @appointment_receipt_success_sub_title.
  ///
  /// In en, this message translates to:
  /// **'Your appointment has been created. You can track your appointment details in the \'My Appointments\' section.'**
  String get appointment_receipt_success_sub_title;

  /// No description provided for @appointment_receipt_download_button.
  ///
  /// In en, this message translates to:
  /// **'Download Receipt'**
  String get appointment_receipt_download_button;

  /// No description provided for @appointment_receipt_information_salon.
  ///
  /// In en, this message translates to:
  /// **'Salon'**
  String get appointment_receipt_information_salon;

  /// No description provided for @appointment_receipt_information_customer_name.
  ///
  /// In en, this message translates to:
  /// **'Customer Name'**
  String get appointment_receipt_information_customer_name;

  /// No description provided for @appointment_receipt_information_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get appointment_receipt_information_phone;

  /// No description provided for @appointment_receipt_information_booking_date.
  ///
  /// In en, this message translates to:
  /// **'Appointment Date'**
  String get appointment_receipt_information_booking_date;

  /// No description provided for @appointment_receipt_information_booking_time.
  ///
  /// In en, this message translates to:
  /// **'Appointment Time'**
  String get appointment_receipt_information_booking_time;

  /// No description provided for @appointment_receipt_information_stylist.
  ///
  /// In en, this message translates to:
  /// **'Stylist'**
  String get appointment_receipt_information_stylist;

  /// No description provided for @appointment_receipt_title.
  ///
  /// In en, this message translates to:
  /// **'Appointment Summary Receipt'**
  String get appointment_receipt_title;

  /// No description provided for @appointment_receipt_sub_title.
  ///
  /// In en, this message translates to:
  /// **'SalonMate Application'**
  String get appointment_receipt_sub_title;

  /// No description provided for @appointment_receipt_salon.
  ///
  /// In en, this message translates to:
  /// **'Salon'**
  String get appointment_receipt_salon;

  /// No description provided for @appointment_receipt_customer_name.
  ///
  /// In en, this message translates to:
  /// **'Customer Name'**
  String get appointment_receipt_customer_name;

  /// No description provided for @appointment_receipt_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get appointment_receipt_phone;

  /// No description provided for @appointment_receipt_booking_date.
  ///
  /// In en, this message translates to:
  /// **'Appointment Date'**
  String get appointment_receipt_booking_date;

  /// No description provided for @appointment_receipt_booking_time.
  ///
  /// In en, this message translates to:
  /// **'Appointment Time'**
  String get appointment_receipt_booking_time;

  /// No description provided for @appointment_receipt_stylist.
  ///
  /// In en, this message translates to:
  /// **'Stylist'**
  String get appointment_receipt_stylist;

  /// No description provided for @appointment_receipt_total.
  ///
  /// In en, this message translates to:
  /// **'TOTAL'**
  String get appointment_receipt_total;

  /// No description provided for @appointment_date_select_appbar.
  ///
  /// In en, this message translates to:
  /// **'Date & Time'**
  String get appointment_date_select_appbar;

  /// No description provided for @appointmnet_date_select_loading_title.
  ///
  /// In en, this message translates to:
  /// **'Loading Appointment Dates'**
  String get appointmnet_date_select_loading_title;

  /// No description provided for @appointment_date_select_loading_sub_title.
  ///
  /// In en, this message translates to:
  /// **'Please Wait...'**
  String get appointment_date_select_loading_sub_title;

  /// No description provided for @appointment_date_select_token_not_avaible.
  ///
  /// In en, this message translates to:
  /// **'Token Not Available'**
  String get appointment_date_select_token_not_avaible;

  /// No description provided for @appointment_date_select_error_title.
  ///
  /// In en, this message translates to:
  /// **'Appointment Dates Not Found!'**
  String get appointment_date_select_error_title;

  /// No description provided for @appointment_date_select_error_sub_title.
  ///
  /// In en, this message translates to:
  /// **'There was an error loading appointment dates. Please try again later.'**
  String get appointment_date_select_error_sub_title;

  /// No description provided for @appointment_date_select_title.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get appointment_date_select_title;

  /// No description provided for @appointment_date_select_selected_day.
  ///
  /// In en, this message translates to:
  /// **'Selected Day'**
  String get appointment_date_select_selected_day;

  /// No description provided for @appointmnet_date_select_confirm_button.
  ///
  /// In en, this message translates to:
  /// **'Confirm Appointment'**
  String get appointmnet_date_select_confirm_button;

  /// No description provided for @appointment_date_select_hour_select_error.
  ///
  /// In en, this message translates to:
  /// **'Please select an appointment time.'**
  String get appointment_date_select_hour_select_error;

  /// No description provided for @appointment_stylist_select_appbar.
  ///
  /// In en, this message translates to:
  /// **'Select Your Stylist'**
  String get appointment_stylist_select_appbar;

  /// No description provided for @appointment_stylist_select_loading_title.
  ///
  /// In en, this message translates to:
  /// **'Loading Stylists'**
  String get appointment_stylist_select_loading_title;

  /// No description provided for @appointment_stylist_select_loading_sub_title.
  ///
  /// In en, this message translates to:
  /// **'Please Wait...'**
  String get appointment_stylist_select_loading_sub_title;

  /// No description provided for @appointment_stylist_select_error_title.
  ///
  /// In en, this message translates to:
  /// **'An Error Occurred'**
  String get appointment_stylist_select_error_title;

  /// No description provided for @appointment_stylist_select_error_sub_title.
  ///
  /// In en, this message translates to:
  /// **'There was an error loading stylists. Please try again later.'**
  String get appointment_stylist_select_error_sub_title;

  /// No description provided for @appointment_stylist_select_not_found_title.
  ///
  /// In en, this message translates to:
  /// **'Stylists Not Loaded Yet!'**
  String get appointment_stylist_select_not_found_title;

  /// No description provided for @appointment_stylist_select_not_found_sub_title.
  ///
  /// In en, this message translates to:
  /// **'No stylists found in the salon. Please try again later.'**
  String get appointment_stylist_select_not_found_sub_title;

  /// No description provided for @appointment_stylist_select_continue_button.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get appointment_stylist_select_continue_button;

  /// No description provided for @appointment_stylist_select_error.
  ///
  /// In en, this message translates to:
  /// **'Please select a stylist.'**
  String get appointment_stylist_select_error;

  /// No description provided for @appointment_stylist_token_not_avaible.
  ///
  /// In en, this message translates to:
  /// **'Token Not Available'**
  String get appointment_stylist_token_not_avaible;

  /// No description provided for @appointment_mixin_exit_date_dialog_appbar.
  ///
  /// In en, this message translates to:
  /// **'DATE & TIME'**
  String get appointment_mixin_exit_date_dialog_appbar;

  /// No description provided for @appointment_mixin_exit_date_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to exit date selection?'**
  String get appointment_mixin_exit_date_dialog_title;

  /// No description provided for @appointment_mixin_exit_date_dialog_sub_title.
  ///
  /// In en, this message translates to:
  /// **'If you exit, you will need to select a stylist again!'**
  String get appointment_mixin_exit_date_dialog_sub_title;

  /// No description provided for @appointment_mixin_exit_date_dialog_yes.
  ///
  /// In en, this message translates to:
  /// **'YES'**
  String get appointment_mixin_exit_date_dialog_yes;

  /// No description provided for @appointment_mixin_exit_date_dialog_no.
  ///
  /// In en, this message translates to:
  /// **'NO'**
  String get appointment_mixin_exit_date_dialog_no;

  /// No description provided for @appointment_mixin_exit_summary_dialog_appbar.
  ///
  /// In en, this message translates to:
  /// **'APPOINTMENT SUMMARY'**
  String get appointment_mixin_exit_summary_dialog_appbar;

  /// No description provided for @appointment_mixin_exit_summary_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to exit the appointment summary?'**
  String get appointment_mixin_exit_summary_dialog_title;

  /// No description provided for @appointment_mixin_exit_summary_dialog_sub_title.
  ///
  /// In en, this message translates to:
  /// **'If you exit, you will need to select a date again!'**
  String get appointment_mixin_exit_summary_dialog_sub_title;

  /// No description provided for @appointment_mixin_exit_summary_dialog_yes.
  ///
  /// In en, this message translates to:
  /// **'YES'**
  String get appointment_mixin_exit_summary_dialog_yes;

  /// No description provided for @appointment_mixin_exit_summary_dialog_no.
  ///
  /// In en, this message translates to:
  /// **'NO'**
  String get appointment_mixin_exit_summary_dialog_no;

  /// No description provided for @appointment_mixin_create_error.
  ///
  /// In en, this message translates to:
  /// **'An Error Occurred'**
  String get appointment_mixin_create_error;

  /// No description provided for @appointment_mixin_update_error.
  ///
  /// In en, this message translates to:
  /// **'An Error Occurred'**
  String get appointment_mixin_update_error;

  /// No description provided for @appointment_mixin_loading_title.
  ///
  /// In en, this message translates to:
  /// **'Please Wait...'**
  String get appointment_mixin_loading_title;

  /// No description provided for @appointment_mixin_evaluation_create_erorr.
  ///
  /// In en, this message translates to:
  /// **'An error occurred during evaluation!'**
  String get appointment_mixin_evaluation_create_erorr;

  /// No description provided for @appointment_mixin_evaluation_create_loading.
  ///
  /// In en, this message translates to:
  /// **'Please Wait...'**
  String get appointment_mixin_evaluation_create_loading;

  /// No description provided for @bottom_navigator_exit_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Do you want to exit?'**
  String get bottom_navigator_exit_dialog_title;

  /// No description provided for @bottom_navigator_exit_dialog_sub_title.
  ///
  /// In en, this message translates to:
  /// **'Don\'t worry, you can log in automatically again!'**
  String get bottom_navigator_exit_dialog_sub_title;

  /// No description provided for @bottom_navigator_exit_dialog_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get bottom_navigator_exit_dialog_yes;

  /// No description provided for @bottom_navigator_exit_dialog_no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get bottom_navigator_exit_dialog_no;

  /// No description provided for @favorite_appbar.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorite_appbar;

  /// No description provided for @favorite_not_found_title.
  ///
  /// In en, this message translates to:
  /// **'No Favorite Salons Found'**
  String get favorite_not_found_title;

  /// No description provided for @favorite_not_found_sub_title.
  ///
  /// In en, this message translates to:
  /// **'No favorite salons found'**
  String get favorite_not_found_sub_title;

  /// No description provided for @favorite_loading_title.
  ///
  /// In en, this message translates to:
  /// **'Loading Favorites'**
  String get favorite_loading_title;

  /// No description provided for @favorite_loading_sub_title.
  ///
  /// In en, this message translates to:
  /// **'Please Wait...'**
  String get favorite_loading_sub_title;

  /// No description provided for @favorite_token_not_avaible.
  ///
  /// In en, this message translates to:
  /// **'Token Not Available'**
  String get favorite_token_not_avaible;

  /// No description provided for @favorite_error.
  ///
  /// In en, this message translates to:
  /// **'Favorite Salons Not Found'**
  String get favorite_error;

  /// No description provided for @favorite_second_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred!'**
  String get favorite_second_error;

  /// No description provided for @favorite_toggle_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while adding to favorites'**
  String get favorite_toggle_error;

  /// No description provided for @home_welcome_appbar.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get home_welcome_appbar;

  /// No description provided for @home_unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get home_unknown;

  /// No description provided for @home_search.
  ///
  /// In en, this message translates to:
  /// **'Start searching for salons'**
  String get home_search;

  /// No description provided for @home_banner_card_title.
  ///
  /// In en, this message translates to:
  /// **'Morning Special!'**
  String get home_banner_card_title;

  /// No description provided for @home_banner_card_sub_title.
  ///
  /// In en, this message translates to:
  /// **'Get 20% Off'**
  String get home_banner_card_sub_title;

  /// No description provided for @home_banner_card_explanation.
  ///
  /// In en, this message translates to:
  /// **'on All Haircuts Between 9-10 AM.'**
  String get home_banner_card_explanation;

  /// No description provided for @home_banner_button.
  ///
  /// In en, this message translates to:
  /// **'Book Now'**
  String get home_banner_button;

  /// No description provided for @home_services_title.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get home_services_title;

  /// No description provided for @home_salons_title.
  ///
  /// In en, this message translates to:
  /// **'Nearby Salons'**
  String get home_salons_title;

  /// No description provided for @home_view_on_map.
  ///
  /// In en, this message translates to:
  /// **'View on Map'**
  String get home_view_on_map;

  /// No description provided for @home_token_not_avaible.
  ///
  /// In en, this message translates to:
  /// **'Token Not Available'**
  String get home_token_not_avaible;

  /// No description provided for @home_category_error.
  ///
  /// In en, this message translates to:
  /// **'Category Not Found'**
  String get home_category_error;

  /// No description provided for @home_salon_error.
  ///
  /// In en, this message translates to:
  /// **'Salons Not Found'**
  String get home_salon_error;

  /// No description provided for @home_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while loading information. Please try again later.'**
  String get home_error;

  /// No description provided for @map_appbar.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get map_appbar;

  /// No description provided for @map_unknown_location.
  ///
  /// In en, this message translates to:
  /// **'Unknown Location'**
  String get map_unknown_location;

  /// No description provided for @map_unknown_district.
  ///
  /// In en, this message translates to:
  /// **'Unknown District'**
  String get map_unknown_district;

  /// No description provided for @map_location_permission_not_found_title.
  ///
  /// In en, this message translates to:
  /// **'Location Permission Not Found'**
  String get map_location_permission_not_found_title;

  /// No description provided for @map_location_permission_not_found_sub_title.
  ///
  /// In en, this message translates to:
  /// **'To get the best experience from salon maps, please grant location access.'**
  String get map_location_permission_not_found_sub_title;

  /// No description provided for @map_location_permission_application_setting_button.
  ///
  /// In en, this message translates to:
  /// **'APP SETTINGS'**
  String get map_location_permission_application_setting_button;

  /// No description provided for @location_permission_appbar.
  ///
  /// In en, this message translates to:
  /// **'LOCATION PERMISSION'**
  String get location_permission_appbar;

  /// No description provided for @notification_appbar.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notification_appbar;

  /// No description provided for @password_appbar.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get password_appbar;

  /// No description provided for @password_title.
  ///
  /// In en, this message translates to:
  /// **'Enter Verification Code 🔒️'**
  String get password_title;

  /// No description provided for @password_sub_title.
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code received on your new password.'**
  String get password_sub_title;

  /// No description provided for @password_new_password.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get password_new_password;

  /// No description provided for @password_confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get password_confirm_password;

  /// No description provided for @password_save_button.
  ///
  /// In en, this message translates to:
  /// **'Save Password'**
  String get password_save_button;

  /// No description provided for @password_confirm_error.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your passwords.'**
  String get password_confirm_error;

  /// No description provided for @password_send_code_error.
  ///
  /// In en, this message translates to:
  /// **'Phone Number Not Found.'**
  String get password_send_code_error;

  /// No description provided for @password_send_code_second.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while requesting a password reset. Please try again later.'**
  String get password_send_code_second;

  /// No description provided for @password_send_code_three.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while requesting a password reset. Please try again later.'**
  String get password_send_code_three;

  /// No description provided for @password_verification_code_error.
  ///
  /// In en, this message translates to:
  /// **'The code is incorrect or has expired.'**
  String get password_verification_code_error;

  /// No description provided for @password_verification_code_error_second.
  ///
  /// In en, this message translates to:
  /// **'Phone Number Not Found.'**
  String get password_verification_code_error_second;

  /// No description provided for @password_verification_code_error_three.
  ///
  /// In en, this message translates to:
  /// **'An error occurred during code verification. Please try again later.'**
  String get password_verification_code_error_three;

  /// No description provided for @password_verification_code_error_four.
  ///
  /// In en, this message translates to:
  /// **'An error occurred during code verification. Please try again later.'**
  String get password_verification_code_error_four;

  /// No description provided for @password_new_password_error.
  ///
  /// In en, this message translates to:
  /// **'Please fill in the required fields.'**
  String get password_new_password_error;

  /// No description provided for @password_new_password_error_second.
  ///
  /// In en, this message translates to:
  /// **'User not found or password is incorrect. Please try again later.'**
  String get password_new_password_error_second;

  /// No description provided for @password_new_password_error_three.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while updating the password. Please try again later.'**
  String get password_new_password_error_three;

  /// No description provided for @password_new_password_error_four.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while updating the password. Please try again later.'**
  String get password_new_password_error_four;

  /// No description provided for @password_loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get password_loading;

  /// No description provided for @password_send_code_appbar.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get password_send_code_appbar;

  /// No description provided for @password_send_code_title.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Phone Number 📞'**
  String get password_send_code_title;

  /// No description provided for @password_send_code_sub_title.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number, verify the received code, and reset your password.'**
  String get password_send_code_sub_title;

  /// No description provided for @password_send_code_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get password_send_code_phone_number;

  /// No description provided for @password_send_code_button.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get password_send_code_button;

  /// No description provided for @password_verification_code_appbar.
  ///
  /// In en, this message translates to:
  /// **'Verify Code'**
  String get password_verification_code_appbar;

  /// No description provided for @password_verification_code_title.
  ///
  /// In en, this message translates to:
  /// **'Enter Verification Code ✅'**
  String get password_verification_code_title;

  /// No description provided for @password_verification_code_sub_title.
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code sent to your phone number.'**
  String get password_verification_code_sub_title;

  /// No description provided for @password_verification_code.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get password_verification_code;

  /// No description provided for @password_verification_code_button.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get password_verification_code_button;

  /// No description provided for @salons_appbar.
  ///
  /// In en, this message translates to:
  /// **'Salons'**
  String get salons_appbar;

  /// No description provided for @salons_error_title.
  ///
  /// In en, this message translates to:
  /// **'An Error Occurred!'**
  String get salons_error_title;

  /// No description provided for @salons_error_default_sub_title.
  ///
  /// In en, this message translates to:
  /// **'An error occurred. Please try again later.'**
  String get salons_error_default_sub_title;

  /// No description provided for @salons_search.
  ///
  /// In en, this message translates to:
  /// **'Salon Name'**
  String get salons_search;

  /// No description provided for @salons_not_found_title.
  ///
  /// In en, this message translates to:
  /// **'The Hair Salon You Are Looking for Is Not Available'**
  String get salons_not_found_title;

  /// No description provided for @salons_not_found_sub_title.
  ///
  /// In en, this message translates to:
  /// **'It looks like the salon you are looking for is not available in our app. You can search for a different hair salon.'**
  String get salons_not_found_sub_title;

  /// No description provided for @token_not_avaible.
  ///
  /// In en, this message translates to:
  /// **'Token Not Available'**
  String get token_not_avaible;

  /// No description provided for @salons_error.
  ///
  /// In en, this message translates to:
  /// **'Salons could not be loaded. An error occurred. Please try again later.'**
  String get salons_error;

  /// No description provided for @salons_salon_detail_error.
  ///
  /// In en, this message translates to:
  /// **'Salon details could not be loaded. An error occurred. Please try again later!'**
  String get salons_salon_detail_error;

  /// No description provided for @salons_salon_services_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while loading services. Please try again later.'**
  String get salons_salon_services_error;

  /// No description provided for @salons_second_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred. Please try again later.'**
  String get salons_second_error;

  /// No description provided for @salons_catch_error.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred.'**
  String get salons_catch_error;

  /// No description provided for @salons_favorite_remove.
  ///
  /// In en, this message translates to:
  /// **'Removed from Favorites'**
  String get salons_favorite_remove;

  /// No description provided for @salons_favorite_add.
  ///
  /// In en, this message translates to:
  /// **'Added to Favorites'**
  String get salons_favorite_add;

  /// No description provided for @salons_favorite_toggle_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while adding to favorites.'**
  String get salons_favorite_toggle_error;

  /// No description provided for @salons_detail_services_title.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get salons_detail_services_title;

  /// No description provided for @salons_detail_token_not_avaible.
  ///
  /// In en, this message translates to:
  /// **'Token Not Available'**
  String get salons_detail_token_not_avaible;

  /// No description provided for @salons_information_appbar.
  ///
  /// In en, this message translates to:
  /// **'About Salon'**
  String get salons_information_appbar;

  /// No description provided for @salons_information_name.
  ///
  /// In en, this message translates to:
  /// **'Salon Name'**
  String get salons_information_name;

  /// No description provided for @salons_information_city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get salons_information_city;

  /// No description provided for @salons_information_district.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get salons_information_district;

  /// No description provided for @salons_information_address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get salons_information_address;

  /// No description provided for @salons_information_email.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get salons_information_email;

  /// No description provided for @salons_information_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get salons_information_phone_number;

  /// No description provided for @salons_information_open_close_time.
  ///
  /// In en, this message translates to:
  /// **'Hall Opening Hours'**
  String get salons_information_open_close_time;

  /// No description provided for @salons_information_open_time.
  ///
  /// In en, this message translates to:
  /// **'Opening Time'**
  String get salons_information_open_time;

  /// No description provided for @salons_information_close_time.
  ///
  /// In en, this message translates to:
  /// **'Closing Time'**
  String get salons_information_close_time;

  /// No description provided for @salons_information_sunday_open.
  ///
  /// In en, this message translates to:
  /// **'Weekend:'**
  String get salons_information_sunday_open;

  /// No description provided for @salons_information_open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get salons_information_open;

  /// No description provided for @salons_information_close.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get salons_information_close;

  /// No description provided for @salons_information_call_button.
  ///
  /// In en, this message translates to:
  /// **'Call Salon'**
  String get salons_information_call_button;

  /// No description provided for @services_loading_title.
  ///
  /// In en, this message translates to:
  /// **'Loading Services'**
  String get services_loading_title;

  /// No description provided for @services_loading_sub_title.
  ///
  /// In en, this message translates to:
  /// **'Please Wait...'**
  String get services_loading_sub_title;

  /// No description provided for @services_error_title.
  ///
  /// In en, this message translates to:
  /// **'No Services Found in Your Name!'**
  String get services_error_title;

  /// No description provided for @services_error_sub_title.
  ///
  /// In en, this message translates to:
  /// **'You can also check other available services.'**
  String get services_error_sub_title;

  /// No description provided for @services_token_not_avaible.
  ///
  /// In en, this message translates to:
  /// **'Token Not Available'**
  String get services_token_not_avaible;

  /// No description provided for @services_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while loading services. Please try again later!'**
  String get services_error;

  /// No description provided for @sign_or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get sign_or;

  /// No description provided for @sign_title.
  ///
  /// In en, this message translates to:
  /// **'Book an Appointment in Minutes\nfor Your Perfect Look!'**
  String get sign_title;

  /// No description provided for @sign_sign_in_button.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get sign_sign_in_button;

  /// No description provided for @sign_google_auth_button.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get sign_google_auth_button;

  /// No description provided for @sign_apple_auth_button.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get sign_apple_auth_button;

  /// No description provided for @sign_coming_very_soon.
  ///
  /// In en, this message translates to:
  /// **'Coming Very Soon!'**
  String get sign_coming_very_soon;

  /// No description provided for @sign_in_appbar.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get sign_in_appbar;

  /// No description provided for @sign_in_title.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back to SalonMake! 👋'**
  String get sign_in_title;

  /// No description provided for @sign_in_sub_title.
  ///
  /// In en, this message translates to:
  /// **'Sign in to your account and receive services from hair salons near you.'**
  String get sign_in_sub_title;

  /// No description provided for @sign_in_user_name.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get sign_in_user_name;

  /// No description provided for @sign_in_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get sign_in_password;

  /// No description provided for @sign_in_forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get sign_in_forgot_password;

  /// No description provided for @sign_in_button.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get sign_in_button;

  /// No description provided for @sign_in_dont_have_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account yet?'**
  String get sign_in_dont_have_account;

  /// No description provided for @sign_in_register_button.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get sign_in_register_button;

  /// No description provided for @sign_in_notification_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred with the notification feature.'**
  String get sign_in_notification_error;

  /// No description provided for @sign_in_email_and_password_error.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password.'**
  String get sign_in_email_and_password_error;

  /// No description provided for @sign_in_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred during sign-in. Please try again later.'**
  String get sign_in_error;

  /// No description provided for @sign_in_loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get sign_in_loading;

  /// No description provided for @sign_up_appbar.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get sign_up_appbar;

  /// No description provided for @sign_up_title.
  ///
  /// In en, this message translates to:
  /// **'Create Your SalonMake Account.✂️'**
  String get sign_up_title;

  /// No description provided for @sign_up_sub_title.
  ///
  /// In en, this message translates to:
  /// **'Create your account and start receiving services.'**
  String get sign_up_sub_title;

  /// No description provided for @sign_up_full_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get sign_up_full_name;

  /// No description provided for @sign_up_user_name.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get sign_up_user_name;

  /// No description provided for @sign_up_email.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get sign_up_email;

  /// No description provided for @sign_up_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get sign_up_password;

  /// No description provided for @sign_up_next_button.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get sign_up_next_button;

  /// No description provided for @sign_up_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get sign_up_have_account;

  /// No description provided for @sign_up_sign_in_button.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get sign_up_sign_in_button;

  /// No description provided for @sign_up_selected_city_district_error.
  ///
  /// In en, this message translates to:
  /// **'Please select a city and district.'**
  String get sign_up_selected_city_district_error;

  /// No description provided for @sign_up_phone_number_error.
  ///
  /// In en, this message translates to:
  /// **'This phone number is already registered.'**
  String get sign_up_phone_number_error;

  /// No description provided for @sign_up_verification_code_error.
  ///
  /// In en, this message translates to:
  /// **'Phone verification request was not accepted, please try again later.'**
  String get sign_up_verification_code_error;

  /// No description provided for @sign_up_error.
  ///
  /// In en, this message translates to:
  /// **'User could not be registered, please try again later.'**
  String get sign_up_error;

  /// No description provided for @sign_up_code_false_error.
  ///
  /// In en, this message translates to:
  /// **'The code is incorrect or expired.'**
  String get sign_up_code_false_error;

  /// No description provided for @sign_up_code_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred during code verification, please try again later.'**
  String get sign_up_code_error;

  /// No description provided for @sign_up_success.
  ///
  /// In en, this message translates to:
  /// **'Your account has been successfully created.'**
  String get sign_up_success;

  /// No description provided for @sign_up_required_fields_error.
  ///
  /// In en, this message translates to:
  /// **'Please fill in the required fields!'**
  String get sign_up_required_fields_error;

  /// No description provided for @sign_up_email_error.
  ///
  /// In en, this message translates to:
  /// **'This email address is already registered.'**
  String get sign_up_email_error;

  /// No description provided for @sign_up_username_error.
  ///
  /// In en, this message translates to:
  /// **'This username is already taken.'**
  String get sign_up_username_error;

  /// No description provided for @sign_up_loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get sign_up_loading;

  /// No description provided for @sign_up_send_code_appbar.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get sign_up_send_code_appbar;

  /// No description provided for @sign_up_send_code_title.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Phone Number 📞'**
  String get sign_up_send_code_title;

  /// No description provided for @sign_up_send_code_sub_title.
  ///
  /// In en, this message translates to:
  /// **'Enter and verify your phone number.'**
  String get sign_up_send_code_sub_title;

  /// No description provided for @sign_up_send_code_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get sign_up_send_code_phone_number;

  /// No description provided for @sign_up_send_code_button.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get sign_up_send_code_button;

  /// No description provided for @sign_up_verification_code_appbar.
  ///
  /// In en, this message translates to:
  /// **'Verify Code'**
  String get sign_up_verification_code_appbar;

  /// No description provided for @sign_up_verification_code_title.
  ///
  /// In en, this message translates to:
  /// **'Enter the Verification Code ✅'**
  String get sign_up_verification_code_title;

  /// No description provided for @sign_up_verification_code_sub_title.
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code sent to your phone number.'**
  String get sign_up_verification_code_sub_title;

  /// No description provided for @sign_up_verification_code_verification_code.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get sign_up_verification_code_verification_code;

  /// No description provided for @sign_up_verification_code_button.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get sign_up_verification_code_button;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get sunday;

  /// No description provided for @short_monday.
  ///
  /// In en, this message translates to:
  /// **'MON'**
  String get short_monday;

  /// No description provided for @short_tuesday.
  ///
  /// In en, this message translates to:
  /// **'TUE'**
  String get short_tuesday;

  /// No description provided for @short_wednesday.
  ///
  /// In en, this message translates to:
  /// **'WED'**
  String get short_wednesday;

  /// No description provided for @short_thursday.
  ///
  /// In en, this message translates to:
  /// **'THU'**
  String get short_thursday;

  /// No description provided for @short_friday.
  ///
  /// In en, this message translates to:
  /// **'FRI'**
  String get short_friday;

  /// No description provided for @short_saturday.
  ///
  /// In en, this message translates to:
  /// **'SAT'**
  String get short_saturday;

  /// No description provided for @short_sunday.
  ///
  /// In en, this message translates to:
  /// **'SUN'**
  String get short_sunday;

  /// No description provided for @january.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get january;

  /// No description provided for @february.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get february;

  /// No description provided for @march.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get march;

  /// No description provided for @april.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get april;

  /// No description provided for @may.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may;

  /// No description provided for @june.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get june;

  /// No description provided for @july.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get july;

  /// No description provided for @august.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get august;

  /// No description provided for @september.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get september;

  /// No description provided for @october.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get october;

  /// No description provided for @november.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get november;

  /// No description provided for @december.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get december;

  /// No description provided for @payment_online.
  ///
  /// In en, this message translates to:
  /// **'Online Payment'**
  String get payment_online;

  /// No description provided for @payment_at_salon.
  ///
  /// In en, this message translates to:
  /// **'Pay at Salon'**
  String get payment_at_salon;

  /// No description provided for @show_warning_alert_okey.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get show_warning_alert_okey;

  /// No description provided for @validator_required_field.
  ///
  /// In en, this message translates to:
  /// **'Required Field'**
  String get validator_required_field;

  /// No description provided for @validator_invalid_error.
  ///
  /// In en, this message translates to:
  /// **'Invalid Value'**
  String get validator_invalid_error;

  /// No description provided for @validator_email_empty_error.
  ///
  /// In en, this message translates to:
  /// **'Email field cannot be left empty'**
  String get validator_email_empty_error;

  /// No description provided for @validator_email_invalid_error.
  ///
  /// In en, this message translates to:
  /// **'Invalid email format'**
  String get validator_email_invalid_error;

  /// No description provided for @validator_password_empty.
  ///
  /// In en, this message translates to:
  /// **'Password field cannot be left empty'**
  String get validator_password_empty;

  /// No description provided for @validator_password_min_length.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters long'**
  String get validator_password_min_length;

  /// No description provided for @validator_password_uppercase.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one uppercase letter'**
  String get validator_password_uppercase;

  /// No description provided for @validator_password_lowercase.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one lowercase letter'**
  String get validator_password_lowercase;

  /// No description provided for @validator_password_number.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one number'**
  String get validator_password_number;

  /// No description provided for @validator_password_special_character.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one special character'**
  String get validator_password_special_character;

  /// No description provided for @validator_phone_invalid_error.
  ///
  /// In en, this message translates to:
  /// **'Invalid Phone Number'**
  String get validator_phone_invalid_error;

  /// No description provided for @appointment_card_add_services.
  ///
  /// In en, this message translates to:
  /// **'Additional Services'**
  String get appointment_card_add_services;

  /// No description provided for @appointment_card_update.
  ///
  /// In en, this message translates to:
  /// **'Your Appointment Date Has Been Updated!!'**
  String get appointment_card_update;

  /// No description provided for @appointment_card_cancel_button.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get appointment_card_cancel_button;

  /// No description provided for @appointment_card_accept_button.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get appointment_card_accept_button;

  /// No description provided for @stylist_card_expert_category.
  ///
  /// In en, this message translates to:
  /// **'Hair Expert'**
  String get stylist_card_expert_category;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'tr': return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
