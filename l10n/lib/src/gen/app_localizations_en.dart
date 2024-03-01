import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'ERP';

  @override
  String get enter => 'Login';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Forgot my password';

  @override
  String get register => 'Register';

  @override
  String get requiredField => 'Required Field';

  @override
  String get passwordRequireNumber => 'The password must contain a number';

  @override
  String get passwordRequireLetter => 'The password must contain a letter';

  @override
  String get passwordShort => 'Password too small';

  @override
  String get emailInvalid => 'Enter a valid email';

  @override
  String get ingredients => 'Ingredients';

  @override
  String get home => 'Home';

  @override
  String get name => 'Name';

  @override
  String get description => 'Description';

  @override
  String get price => 'Price';

  @override
  String get amount => 'Amount';

  @override
  String get unitMeasurement => 'Unit Measurement';
}
