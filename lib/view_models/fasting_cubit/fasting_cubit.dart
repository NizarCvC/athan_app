import 'package:athan_app/models/fasting_models/fasting_data.dart';
import 'package:athan_app/models/fasting_models/fasting_params.dart';
import 'package:athan_app/services/fasting_services.dart';
import 'package:athan_app/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';

part 'fasting_state.dart';

class FastingCubit extends Cubit<FastingState> {
  FastingCubit() : super(FastingInitial());

  final _fastingServices = FastingServices();

  Future<Location?> _getGeocodingByCityName(String cityName) async {
    final geocoding = Geocoding();
    List<Location> locations = await geocoding.locationFromAddress(cityName);
    return locations.isEmpty ? null : locations.first;
  }

  Future<void> fetchFastingInfo(String cityName) async {
    emit(FetchingFastingInfo());

    try {
      final location = await _getGeocodingByCityName(cityName);

      if (location == null) {
        emit(FetchedFastingInfo(fastingData: null));
        return;
      }
      final queryParams = FastingParams(
        lat: location.latitude,
        lon: location.longitude,
        apiKey: AppConstants.apiKey,
      );

      final fastingInfo = await _fastingServices.getFastingTime(queryParams);

      emit(FetchedFastingInfo(fastingData: fastingInfo.data));
    } catch (e) {
      emit(FetchingFastingInfoFailed(e.toString()));
    }
  }
}
