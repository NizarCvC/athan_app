import 'package:athan_app/models/dua_models/dua_params.dart';
import 'package:athan_app/models/dua_models/dua_translation.dart';
import 'package:athan_app/models/ruqyah_models/dua_request_type.dart';
import 'package:athan_app/services/dua_services.dart';
import 'package:athan_app/utils/app_constants.dart';
import 'package:athan_app/view_models/settings_cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dua_state.dart';

class DuaCubit extends Cubit<DuaState> {
  DuaCubit({required SettingsCubit settingsCubit})
    : _settingsCubit = settingsCubit,
      super(DuaInitial());

  final _duaServices = DuaServices();
  final SettingsCubit _settingsCubit;

  Future<void> fetchRandomDua() async {
    emit(FetchingRandomDua());

    try {
      final settings = _settingsCubit.state;
      final params = DuaParams(
        type: DuaRequestType.translation,
        apiKey: AppConstants.apiKey,
        lang: settings.languageCode,
        random: true,
      );

      final randomDuaInfo = await _duaServices.getDuaTranslation(params);

      if (randomDuaInfo.singleData != null) {
        emit(FetchedRandomDua(duaTranslation: randomDuaInfo.singleData!));
      } else {
        emit(FetchingRandomDuaFailed('There is no dua data.'));
      }
    } catch (e) {
      emit(FetchingRandomDuaFailed(e.toString()));
    }
  }
}
