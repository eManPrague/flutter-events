import 'dart:async' show Future;

import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/widgets.dart';

enum StringId {
  appTitle,
  homeScreenTitle,
  detailScreenTitle,
}

class EventsLocalizations {
  static const LocalizationsDelegate<EventsLocalizations> delegate = const _EventsLocalizationsDelegate();

  static const Map<String, Map<StringId, String>> _localizedValues = {
    'en': {
      StringId.appTitle: 'Eman\'s events',
      StringId.homeScreenTitle: 'Events',
      StringId.detailScreenTitle: 'Event detail',
    },
    'cs': {
      StringId.appTitle: 'Eman\'s events',
      StringId.homeScreenTitle: 'Akce',
      StringId.detailScreenTitle: 'Detail akce',
    },
  };

  static final Iterable<Locale> supportedLocales = _localizedValues.keys.map((languageCode) => Locale(languageCode));

  static EventsLocalizations of(BuildContext context) => Localizations.of<EventsLocalizations>(context, EventsLocalizations);

  final Locale _locale;

  EventsLocalizations(this._locale);

  String get appTitle => _localizedValues[_locale.languageCode][StringId.appTitle];

  String get homeScreenTitle => _localizedValues[_locale.languageCode][StringId.homeScreenTitle];

  String get detailScreenTitle => _localizedValues[_locale.languageCode][StringId.detailScreenTitle];
}

class _EventsLocalizationsDelegate extends LocalizationsDelegate<EventsLocalizations> {
  const _EventsLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => EventsLocalizations._localizedValues.containsKey(locale.languageCode);

  @override
  Future<EventsLocalizations> load(Locale locale) => SynchronousFuture<EventsLocalizations>(EventsLocalizations(locale));

  @override
  bool shouldReload(LocalizationsDelegate<EventsLocalizations> old) => false;
}
