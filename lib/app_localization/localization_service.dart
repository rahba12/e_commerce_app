// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:e_commerce_app/app_localization/lang/ar_eg.dart';
import 'package:e_commerce_app/app_localization/lang/en_us.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  // Default locale
  // ignore: prefer_const_constructors
  static final locale = Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('ar', 'EG');

  // Supported translations
  // Needs to be same order with locales
  static final langs = [
    'English',
    'Arabic',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en', 'US'),
    const Locale('ar', 'EG'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS, // lang/en_us.dart
        'ar_EG': arEG, // lang/ar_EG.dart
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
