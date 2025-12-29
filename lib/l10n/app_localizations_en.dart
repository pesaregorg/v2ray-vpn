// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'V2Ray VPN';

  @override
  String get anUnknownErrorHasOccurred => 'An unknown error has occurred.';

  @override
  String get addConfig => 'Add config';

  @override
  String get addFromClipboard => 'Add from clipboard';

  @override
  String get close => 'Close';

  @override
  String get checkPing => 'Check all ping';

  @override
  String get connect => 'Connect';

  @override
  String get disconnect => 'Disconnect';

  @override
  String get connected => 'Connected';
}
