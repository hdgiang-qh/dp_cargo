import 'dart:ui';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../generated/l10n.dart';

class SettingService extends GetxService {
  late SharedPreferences prefs;

  Rx<Locale> currentLocate = PlatformDispatcher.instance.locale.obs;

  String? pass;

  Future<SettingService> init() async {
    prefs = await SharedPreferences.getInstance();

    /// password
    pass = prefs.getString('password');

    ///Language
    String languageCode = prefs.getString("languageCode") ?? 'vi';
    var locale = S.delegate.supportedLocales.firstWhere(
      (element) => element.languageCode == languageCode,
      orElse: () => const Locale.fromSubtags(languageCode: "en"),
    );
    currentLocate.value = locale;
    Logger().d('language ===> $languageCode');
    await Get.updateLocale(locale);
    return this;
  }

  Future<void> savePassword(String password) async {
    await prefs.setString('password', password);
    pass = password;
  }

  void updateLocale(Locale locale) async {
    var newLocale = S.delegate.supportedLocales.firstWhere(
      (element) => element.languageCode == locale.languageCode,
      orElse: () => const Locale.fromSubtags(languageCode: "en"),
    );
    await prefs.setString('languageCode', newLocale.languageCode);
    currentLocate.value = newLocale;
    await Get.updateLocale(newLocale);
  }
}
