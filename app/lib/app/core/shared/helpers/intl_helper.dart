import 'package:flutter/material.dart';

class AppLocale {
  final Locale locale;
  final String label;
  final String flagAssetPath;

  AppLocale({
    required this.locale,
    required this.label,
    required this.flagAssetPath,
  });
}

List<AppLocale> appLocales(List<Locale> locales) {
  return locales.map((e) {
    if (e.languageCode == 'pt') {
      return AppLocale(
        locale: e,
        label: 'Português',
        flagAssetPath: 'assets/flags/brazil_flag.png',
      );
    }
    if (e.languageCode == 'en') {
      return AppLocale(
        locale: e,
        label: 'English',
        flagAssetPath: 'assets/flags/eua_flag.png',
      );
    }
    return AppLocale(
      locale: e,
      label: e.toLanguageTag(),
      flagAssetPath: '',
    );
  }).toList();
}
