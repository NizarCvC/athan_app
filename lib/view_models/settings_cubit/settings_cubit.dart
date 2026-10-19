import 'package:athan_app/models/enums/supported_language.dart';
import 'package:athan_app/models/zakat_nisab_models/supported_currency.dart';
import 'package:athan_app/models/zakat_nisab_models/zakat_standard.dart';
import 'package:athan_app/models/zakat_nisab_models/zakat_unit.dart';
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
    final zakatStandard = await _localDatabaseServices.getString(
          AppLocalDatabaseTags.zakatStandardTag,
        ) ??
        ZakatStandard.classical.value;
    final zakatCurrency = await _localDatabaseServices.getString(
          AppLocalDatabaseTags.zakatCurrencyTag,
        ) ??
        SupportedCurrency.usd.code;
    final zakatUnit = await _localDatabaseServices.getString(
          AppLocalDatabaseTags.zakatUnitTag,
        ) ??
        ZakatUnit.gram.value;

    emit(
      state.copyWith(
        themeMode: isLight ? ThemeMode.light : ThemeMode.dark,
        languageCode: SupportedLanguage.values.asNameMap()[lang],
        is24TimeFormat: is24TimeFormat,
        isGregorianFormat: isGregorianFormat,
        zakatStandard: ZakatStandard.values.asNameMap()[zakatStandard],
        supportedCurrency: SupportedCurrency.values.asNameMap()[zakatCurrency],
        zakatUnit: ZakatUnit.values.asNameMap()[zakatUnit],
      ),
    );
  }

  Future<void> toggleTheme(bool isLight) async {
    await _localDatabaseServices.setBool(
      AppLocalDatabaseTags.themeModeTag,
      isLight,
    );
    emit(state.copyWith(themeMode: isLight ? ThemeMode.light : ThemeMode.dark));
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

  Future<void> changeZakatStandard(ZakatStandard standard) async {
    await _localDatabaseServices.setString(
      AppLocalDatabaseTags.zakatStandardTag,
      standard.value,
    );
    emit(state.copyWith(zakatStandard: standard));
  }

  Future<void> changeZakatCurrency(SupportedCurrency currency) async {
    await _localDatabaseServices.setString(
      AppLocalDatabaseTags.zakatCurrencyTag,
      currency.code,
    );
    emit(state.copyWith(supportedCurrency: currency));
  }

  Future<void> changeZakatUnit(ZakatUnit unit) async {
    await _localDatabaseServices.setString(
      AppLocalDatabaseTags.zakatUnitTag,
      unit.value,
    );
    emit(state.copyWith(zakatUnit: unit));
  }

}
