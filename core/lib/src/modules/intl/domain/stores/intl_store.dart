import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';

class IntlStore extends ValueNotifier<Locale> {
  IntlStore()
      : super(
          AppLocalizations.supportedLocales.firstWhere(
            (locale) => locale.languageCode.toLowerCase() == 'pt',
            orElse: () => const Locale('en'),
          ),
        );

  void changeLocale(Locale locale) {
    value = locale;
  }
}
