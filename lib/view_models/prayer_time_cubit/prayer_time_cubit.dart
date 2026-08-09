import 'package:athan_app/models/prayer_time_models/prayer_time_params.dart';
import 'package:athan_app/models/prayer_time_models/single_day_data.dart';
import 'package:athan_app/services/prayer_time_services.dart';
import 'package:athan_app/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';

part 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeCubit() : super(PrayerTimeInitial());

  final _prayerTimeServices = PrayerTimeServices();

  Future<Location?> _getGeocodingByCityName(String cityName) async {
    final geocoding = Geocoding();
    List<Location> locations = await geocoding.locationFromAddress(cityName);
    return locations.isEmpty ? null : locations.first;
  }

  Future<void> fetchTodayPrayerTimes(String cityName) async {
    emit(FetchingTodayPrayerTimes());

    try {
      final location = await _getGeocodingByCityName(cityName);

      if (location == null) {
        emit(FetchedTodayPrayerTimes(todayPrayerTimes: null));
        return;
      }
      final queryParams = PrayerTimeParams(
        apiKey: AppConstants.apiKey,
        lat: location.latitude,
        lon: location.longitude,
      );
      final prayerTimes = await _prayerTimeServices.getDayPrayerTime(
        queryParams,
      );

      emit(FetchedTodayPrayerTimes(todayPrayerTimes: prayerTimes.data));
    } catch (e) {
      emit(FetchingTodayPrayerTimesFailed(e.toString()));
    }
  }

  String getNextPrayerTime(SingleDayData data) {
    final currentTime = Duration(
      hours: DateTime.now().hour,
      minutes: DateTime.now().minute,
    );
    final prayerTimes = data.times!;
    final prayerTimesList = [
      prayerTimes.fajr,
      prayerTimes.sunrise,
      prayerTimes.dhuhr,
      prayerTimes.asr,
      prayerTimes.maghrib,
      prayerTimes.isha,
    ];

    for (var i = 1; i < prayerTimesList.length; i++) {
      final prevPrayerTime = _getTimeFromString(prayerTimesList[i - 1]!);
      final nextPrayerTime = _getTimeFromString(prayerTimesList[i]!);

      if (currentTime > prevPrayerTime && currentTime < nextPrayerTime) {
        return '${nextPrayerTime.inHours}:${nextPrayerTime.inMinutes}';
      }
    }

    return prayerTimes.fajr!;
  }

  String getNextPrayerName(SingleDayData data) {
    final prayerTimes = data.times!;
    final prayerNamesTimes = {
      prayerTimes.fajr: 'Fajr',
      prayerTimes.sunrise: 'Sunrise',
      prayerTimes.dhuhr: 'Dhuhr',
      prayerTimes.asr: 'Asr',
      prayerTimes.maghrib: 'Maghrib',
      prayerTimes.isha: 'Isha',
    };

    return prayerNamesTimes[getNextPrayerTime(data)]!;
  }

  Duration _getTimeFromString(String timeStr) {
    final time = timeStr.split(':');
    return Duration(hours: int.parse(time[0]), minutes: int.parse(time[1]));
  }
}
