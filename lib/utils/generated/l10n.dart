// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Next Pray`
  String get nextPray {
    return Intl.message('Next Pray', name: 'nextPray', desc: '', args: []);
  }

  /// `Fajr`
  String get fajr {
    return Intl.message('Fajr', name: 'fajr', desc: '', args: []);
  }

  /// `Sunrise`
  String get Sunrise {
    return Intl.message('Sunrise', name: 'Sunrise', desc: '', args: []);
  }

  /// `Dhuhr`
  String get dhuhr {
    return Intl.message('Dhuhr', name: 'dhuhr', desc: '', args: []);
  }

  /// `Asr`
  String get asr {
    return Intl.message('Asr', name: 'asr', desc: '', args: []);
  }

  /// `Maghrib`
  String get maghrib {
    return Intl.message('Maghrib', name: 'maghrib', desc: '', args: []);
  }

  /// `Isha`
  String get isha {
    return Intl.message('Isha', name: 'isha', desc: '', args: []);
  }

  /// `Midnight`
  String get midnight {
    return Intl.message('Midnight', name: 'midnight', desc: '', args: []);
  }

  /// `Last Third`
  String get lastthird {
    return Intl.message('Last Third', name: 'lastthird', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `App Theme`
  String get appTheme {
    return Intl.message('App Theme', name: 'appTheme', desc: '', args: []);
  }

  /// `Location`
  String get location {
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `Calendar Format`
  String get calendarFormat {
    return Intl.message(
      'Calendar Format',
      name: 'calendarFormat',
      desc: '',
      args: [],
    );
  }

  /// `Time Format`
  String get timeFormat {
    return Intl.message('Time Format', name: 'timeFormat', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Calculation Method`
  String get calculationMethod {
    return Intl.message(
      'Calculation Method',
      name: 'calculationMethod',
      desc: '',
      args: [],
    );
  }

  /// `Juristic Method`
  String get juristicMethod {
    return Intl.message(
      'Juristic Method',
      name: 'juristicMethod',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get feedback {
    return Intl.message('Feedback', name: 'feedback', desc: '', args: []);
  }

  /// `Athan App`
  String get athanApp {
    return Intl.message('Athan App', name: 'athanApp', desc: '', args: []);
  }

  /// `Version`
  String get version {
    return Intl.message('Version', name: 'version', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Prayer`
  String get prayer {
    return Intl.message('Prayer', name: 'prayer', desc: '', args: []);
  }

  /// `Fasting`
  String get fasting {
    return Intl.message('Fasting', name: 'fasting', desc: '', args: []);
  }

  /// `Zakat`
  String get zakat {
    return Intl.message('Zakat', name: 'zakat', desc: '', args: []);
  }

  /// `Duas`
  String get duas {
    return Intl.message('Duas', name: 'duas', desc: '', args: []);
  }

  /// `Gregorian`
  String get gregorian {
    return Intl.message('Gregorian', name: 'gregorian', desc: '', args: []);
  }

  /// `Hijri`
  String get hijri {
    return Intl.message('Hijri', name: 'hijri', desc: '', args: []);
  }

  /// `Hour Time 24-Hour`
  String get hourTime24 {
    return Intl.message(
      'Hour Time 24-Hour',
      name: 'hourTime24',
      desc: '',
      args: [],
    );
  }

  /// `Hour Time 12-Hour`
  String get hourTime12 {
    return Intl.message(
      'Hour Time 12-Hour',
      name: 'hourTime12',
      desc: '',
      args: [],
    );
  }

  /// `Muharram`
  String get muharram {
    return Intl.message('Muharram', name: 'muharram', desc: '', args: []);
  }

  /// `Safar`
  String get safar {
    return Intl.message('Safar', name: 'safar', desc: '', args: []);
  }

  /// `Rabi al-Awwal`
  String get rabiAlAwwal {
    return Intl.message(
      'Rabi al-Awwal',
      name: 'rabiAlAwwal',
      desc: '',
      args: [],
    );
  }

  /// `Rabi al-Thani`
  String get rabiAlThani {
    return Intl.message(
      'Rabi al-Thani',
      name: 'rabiAlThani',
      desc: '',
      args: [],
    );
  }

  /// `Jumada al-Awwal`
  String get jumadaAlAwwal {
    return Intl.message(
      'Jumada al-Awwal',
      name: 'jumadaAlAwwal',
      desc: '',
      args: [],
    );
  }

  /// `Jumada al-Thani`
  String get jumadaAlThani {
    return Intl.message(
      'Jumada al-Thani',
      name: 'jumadaAlThani',
      desc: '',
      args: [],
    );
  }

  /// `Rajab`
  String get rajab {
    return Intl.message('Rajab', name: 'rajab', desc: '', args: []);
  }

  /// `Shaban`
  String get shaban {
    return Intl.message('Shaban', name: 'shaban', desc: '', args: []);
  }

  /// `Ramadan`
  String get ramadan {
    return Intl.message('Ramadan', name: 'ramadan', desc: '', args: []);
  }

  /// `Shawwal`
  String get shawwal {
    return Intl.message('Shawwal', name: 'shawwal', desc: '', args: []);
  }

  /// `Dhu al-Qidah`
  String get dhuAlQidah {
    return Intl.message('Dhu al-Qidah', name: 'dhuAlQidah', desc: '', args: []);
  }

  /// `Dhu al-Hijjah`
  String get dhuAlHijjah {
    return Intl.message(
      'Dhu al-Hijjah',
      name: 'dhuAlHijjah',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
