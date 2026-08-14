import 'package:athan_app/models/enums/supported_language.dart';
import 'package:athan_app/services/local_database_services.dart';
import 'package:athan_app/utils/app_local_database_tags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState()) {
    _loadSettings();
  }

  final _localDatabaseServices = LocalDatabaseServices();

  Future<void> _loadSettings() async {
    final isLight =
        await _localDatabaseServices.getBool(
          AppLocalDatabaseTags.themeModeTag,
        ) ??
        true;
    final lang =
        await _localDatabaseServices.getString(
          AppLocalDatabaseTags.languageTag,
        ) ??
        SupportedLanguage.en.code;
    final is24TimeFormat =
        await _localDatabaseServices.getBool(
          AppLocalDatabaseTags.timeFormatTag,
        ) ??
        true;
    final isGregorianFormat =
        await _localDatabaseServices.getBool(
          AppLocalDatabaseTags.calenderFormatTag,
        ) ??
        true;

    emit(
      state.copyWith(
        themeMode: isLight ? ThemeMode.light : ThemeMode.dark,
        languageCode: SupportedLanguage.values.asNameMap()[lang],
        is24TimeFormat: is24TimeFormat,
        isGregorianFormat: isGregorianFormat,
      ),
    );
  }

  Future<void> toggleTheme(bool isDark) async {
    await _localDatabaseServices.setBool(
      AppLocalDatabaseTags.themeModeTag,
      isDark,
    );
    emit(state.copyWith(themeMode: isDark ? ThemeMode.dark : ThemeMode.light));
  }

  Future<void> changeLanguage(String langCode) async {
    await _localDatabaseServices.setString(
      AppLocalDatabaseTags.languageTag,
      langCode,
    );
    emit(
      state.copyWith(languageCode: SupportedLanguage.values.byName(langCode)),
    );
  }

  Future<void> changeTimeFormat(bool is24TimeFormat) async {
    await _localDatabaseServices.setBool(
      AppLocalDatabaseTags.timeFormatTag,
      is24TimeFormat,
    );
    emit(state.copyWith(is24TimeFormat: is24TimeFormat));
  }

  Future<void> changeCalenderFormat(bool isGregorianFormat) async {
    await _localDatabaseServices.setBool(
      AppLocalDatabaseTags.calenderFormatTag,
      isGregorianFormat,
    );
    emit(state.copyWith(isGregorianFormat: isGregorianFormat));
  }
}
