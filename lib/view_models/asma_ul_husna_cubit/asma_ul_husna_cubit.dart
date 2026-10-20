import 'package:athan_app/models/asma_ul_husna_models/asma_ul_husna_data.dart';
import 'package:athan_app/models/asma_ul_husna_models/asma_ul_husna_params.dart';
import 'package:athan_app/services/asma_ul_husna_services.dart';
import 'package:athan_app/utils/app_constants.dart';
import 'package:athan_app/view_models/settings_cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'asma_ul_husna_state.dart';

class AsmaUlHusnaCubit extends Cubit<AsmaUlHusnaState> {
  AsmaUlHusnaCubit({required SettingsCubit settingsCubit})
    : _settingsCubit = settingsCubit,
      super(AsmaUlHusnaInitial());

  final _asmaUlHusnaServices = AsmaUlHusnaServices();
  final SettingsCubit _settingsCubit;

  Future<void> fetchAsmaUlHusna() async {
    emit(FetchingAsmaUlHusna());

    try {
      final settings = _settingsCubit.state;
      final params = AsmaUlHusnaParams(
        language: settings.languageCode,
        apiKey: AppConstants.apiKey,
      );

      final asmaUlHusnaInfo = await _asmaUlHusnaServices.getAsmaUlHusna(params);

      if (asmaUlHusnaInfo.data != null) {
        emit(FetchedAsmaUlHusna(asmaUlHusnaData: asmaUlHusnaInfo.data!));
      } else {
        emit(FetchingAsmaUlHusnaFailed('There is no Asma Ul Husna data.'));
      }
    } catch (e) {
      emit(FetchingAsmaUlHusnaFailed(e.toString()));
    }
  }
}
