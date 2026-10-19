part of 'settings_cubit.dart';

class SettingsState {
  final ThemeMode themeMode;
  final SupportedLanguage languageCode;
  final bool is24TimeFormat;
  final bool isGregorianFormat;
  final String cityName;
  final ZakatStandard zakatStandard;
  final SupportedCurrency supportedCurrency;
  final ZakatUnit zakatUnit;

  SettingsState({
    this.themeMode = ThemeMode.light,
    this.languageCode = SupportedLanguage.en,
    this.is24TimeFormat = true,
    this.isGregorianFormat = true,
    this.cityName = 'Medina',
    this.zakatStandard = ZakatStandard.classical,
    this.supportedCurrency = SupportedCurrency.usd,
    this.zakatUnit = ZakatUnit.gram,
  });

  SettingsState copyWith({
    ThemeMode? themeMode,
    SupportedLanguage? languageCode,
    bool? is24TimeFormat,
    bool? isGregorianFormat,
    String? cityName,
    ZakatStandard? zakatStandard,
    SupportedCurrency? supportedCurrency,
    ZakatUnit? zakatUnit,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      languageCode: languageCode ?? this.languageCode,
      is24TimeFormat: is24TimeFormat ?? this.is24TimeFormat,
      isGregorianFormat: isGregorianFormat ?? this.isGregorianFormat,
      cityName: cityName ?? this.cityName,
      zakatStandard: zakatStandard ?? this.zakatStandard,
      supportedCurrency: supportedCurrency ?? this.supportedCurrency,
      zakatUnit: zakatUnit ?? this.zakatUnit,
    );
  }
}
