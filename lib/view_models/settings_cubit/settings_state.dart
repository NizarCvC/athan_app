part of 'settings_cubit.dart';

class SettingsState {
  final ThemeMode themeMode;
  final SupportedLanguage languageCode;
  final bool is24TimeFormat;
  final bool isGregorianFormat;
  final String cityName;
  final ZakatStandard? standard;
  final SupportedCurrency currency;
  final ZakatUnit unit;

  SettingsState({
    this.themeMode = ThemeMode.light,
    this.languageCode = SupportedLanguage.en,
    this.is24TimeFormat = true,
    this.isGregorianFormat = true,
    this.cityName = 'Medina',
    this.standard = .common,
    this.currency = .usd,
    this.unit = .gram,
  });

  SettingsState copyWith({
    ThemeMode? themeMode,
    SupportedLanguage? languageCode,
    bool? is24TimeFormat,
    bool? isGregorianFormat,
    String? cityName,
    ZakatStandard? standard,
    SupportedCurrency? currency,
    ZakatUnit? unit,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      languageCode: languageCode ?? this.languageCode,
      is24TimeFormat: is24TimeFormat ?? this.is24TimeFormat,
      isGregorianFormat: isGregorianFormat ?? this.isGregorianFormat,
      cityName: cityName ?? this.cityName,
      standard: standard ?? this.standard,
      currency: currency ?? this.currency,
      unit: unit ?? this.unit,
    );
  }
}
