import 'package:athan_app/models/zakat_nisab_models/zakat_data.dart';
import 'package:athan_app/models/zakat_nisab_models/zakat_nisab_params.dart';
import 'package:athan_app/services/zakat_nisab_services.dart';
import 'package:athan_app/utils/app_constants.dart';
import 'package:athan_app/view_models/settings_cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'zakat_nisab_state.dart';

class ZakatNisabCubit extends Cubit<ZakatNisabState> {
  ZakatNisabCubit({required SettingsCubit settingsCubit})
    : _settingsCubit = settingsCubit,
      super(ZakatNisabInitial());

  final _zakatNisabServices = ZakatNisabServices();
  final SettingsCubit _settingsCubit;

  Future<void> fetchZakatNisabInfo() async {
    emit(FetchingZakatNisab());

    try {
      final settings = _settingsCubit.state;
      final params = ZakatNisabParams(
        standard: settings.standard,
        currency: settings.currency,
        unit: settings.unit,
        apiKey: AppConstants.apiKey,
      );

      final zakatNisabInfo = await _zakatNisabServices.getZakatNisabValues(
        params,
      );

      if (zakatNisabInfo.data != null) {
        emit(FetchedZakatNisab(zakatNisabInfo: zakatNisabInfo.data!));
      }
      else {
        emit(FetchingZakatNisabFailed('There is no zakat nisab data.'));
      }
    } catch (e) {
      emit(FetchingZakatNisabFailed(e.toString()));
    }
  }
}
