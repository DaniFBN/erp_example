import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';

class IntlStore extends ValueNotifier<Locale> {
  IntlStore() : super(const Locale('pt'));

  List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  void changeLocale(Locale locale) {
    value = locale;
  }
}
