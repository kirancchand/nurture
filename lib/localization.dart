import 'dart:ui';
import 'package:get/get.dart';

import 'lang/en_us.dart';
import 'lang/ja_jp.dart';
import 'lang/tr_tr.dart';
import 'lang/ar_ab.dart';
class Localization extends Translations {
  // Default locale
  static final locale = Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  // static final fallbackLocale = Locale('tr', 'TR');
  static final fallbackLocale = Locale('ar', 'AB');
  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
    // 'Türkçe',
    // '日本語',
    'عربي'
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('en', 'US'),
    // Locale('tr', 'TR'),
    // Locale('ja', 'JP'),
    Locale('ar', 'AB'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    // 'tr_TR': trTR,
    // 'ja_JP': jaJP,
    'ar_AB':arAB
  };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
