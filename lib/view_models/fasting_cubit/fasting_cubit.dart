import 'package:athan_app/models/fasting_models/fasting_data.dart';
import 'package:athan_app/models/fasting_models/fasting_params.dart';
import 'package:athan_app/services/fasting_services.dart';
import 'package:athan_app/utils/app_constants.dart';
import 'package:athan_app/view_models/settings_cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';

part 'fasting_state.dart';

class FastingCubit extends Cubit<FastingState> {
  FastingCubit({required SettingsCubit settingsCubit})
    : _settingsCubit = settingsCubit,
      super(FastingInitial());

  final _fastingServices = FastingServices();
  final SettingsCubit _settingsCubit;

  Future<Location?> _getGeocodingByCityName(String cityName) async {
    final geocoding = Geocoding();
    List<Location> locations = await geocoding.locationFromAddress(cityName);
    return locations.isEmpty ? null : locations.first;
  }

  Future<void> fetchFastingInfo() async {
    emit(FetchingFastingInfo());

    try {
      final location = await _getGeocodingByCityName(_settingsCubit.state.cityName);

      if (location == null) {
        emit(
          FetchingFastingInfoFailed(
            'There is no city with this name: ${_settingsCubit.state.cityName}.',
          ),
        );
        return;
      }
      final queryParams = FastingParams(
        lat: location.latitude,
        lon: location.longitude,
        apiKey: AppConstants.apiKey,
      );

      final fastingInfo = await _fastingServices.getFastingTime(queryParams);

      if (fastingInfo.data != null) {
        emit(FetchedFastingInfo(fastingData: fastingInfo.data!));
      } else {
        emit(FetchingFastingInfoFailed('There is no fasting data.'));
      }
    } catch (e) {
      emit(FetchingFastingInfoFailed(e.toString()));
    }
  }
}
