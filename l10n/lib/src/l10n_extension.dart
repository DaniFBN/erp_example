import 'package:flutter/widgets.dart';
import 'package:l10n/l10n.dart';

extension L10nExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
