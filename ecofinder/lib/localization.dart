import 'package:ecofinder/models/models.dart';
import 'package:flutter/widgets.dart';

class ReduxLocalizations {
  static ReduxLocalizations of(BuildContext context) {
    return Localizations.of<ReduxLocalizations>(context, ReduxLocalizations);
  }

  String get appTitle => 'Ecofinder';

  // AppTab activeTabSelector(AppState state) => state.activeTab;

  // bool isLoadingSelector(AppState state) => state.isLoading;

  // Auth authSelector(AppState state) => state.auth;
}

class ReduxLocalizationsDelegate
    extends LocalizationsDelegate<ReduxLocalizations> {
  @override
  Future<ReduxLocalizations> load(Locale locale) =>
      Future(() => ReduxLocalizations());

  @override
  bool shouldReload(ReduxLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) =>
      locale.languageCode.toLowerCase().contains('en');
}
