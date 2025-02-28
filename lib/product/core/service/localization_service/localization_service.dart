import 'package:salonmate/product/core/base/helper/shared_service.dart';

class LocalizationService {
  static const keyLanguage = 'language_code';

  final PrefService _prefService = PrefService();

  LocalizationService._privateConstructor();
  static final LocalizationService instance =
      LocalizationService._privateConstructor();

  Future<void> setLanguageCode(String languageCode) async {
    await _prefService.saveNormalString(keyLanguage, languageCode);
  }

  Future<String?> getLanguageCode() async {
    return _prefService.getNormalString(keyLanguage);
  }
}
