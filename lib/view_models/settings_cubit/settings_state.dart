part of 'settings_cubit.dart';

class SettingsState {
  final ThemeMode themeMode;
  final SupportedLanguage languageCode;
  final bool is24TimeFormat;
  final bool isGregorianFormat;

  SettingsState({
    this.themeMode = ThemeMode.dark,
    this.languageCode = SupportedLanguage.en,
    this.is24TimeFormat = true,
    this .isGregorianFormat = true
  });

  SettingsState copyWith({
    ThemeMode? themeMode,
    SupportedLanguage? languageCode,
    bool? is24TimeFormat,
    bool? isGregorianFormat
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      languageCode: languageCode ?? this.languageCode,
      is24TimeFormat: is24TimeFormat ?? this.is24TimeFormat,
      isGregorianFormat: isGregorianFormat ?? this.isGregorianFormat
    );
  }
}
