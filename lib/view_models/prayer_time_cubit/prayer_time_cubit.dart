import 'package:athan_app/models/prayer_time_models/prayer_time_params.dart';
import 'package:athan_app/models/prayer_time_models/prayer_times.dart';
import 'package:athan_app/models/prayer_time_models/single_day_data.dart';
import 'package:athan_app/services/prayer_time_services.dart';
import 'package:athan_app/utils/app_constants.dart';
import 'package:athan_app/utils/helpers.dart';
import 'package:flutter/material.dart';
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

  String getNextPrayerTime(PrayerTimes times) {
    final currentTime = TimeOfDay(
      hour: TimeOfDay.now().hour,
      minute: TimeOfDay.now().minute,
    );
    final prayerTimesList = [
      times.fajr,
      times.sunrise,
      times.dhuhr,
      times.asr,
      times.maghrib,
      times.isha,
    ];

    for (var i = 1; i < prayerTimesList.length; i++) {
      final prevPrayerTime = Helpers.getTimeFromString(prayerTimesList[i - 1]!);
      final nextPrayerTime = Helpers.getTimeFromString(prayerTimesList[i]!);
      if (currentTime.isAfter(prevPrayerTime) &&
          currentTime.isBefore(nextPrayerTime)) {
        String hour = Helpers.formatNumber(nextPrayerTime.hour);
        String minute = Helpers.formatNumber(nextPrayerTime.minute);
        return '$hour:$minute';
      }
    }

    return times.fajr!;
  }

  String getNextPrayerName(PrayerTimes times) {
    final prayerNamesTimes = {
      times.fajr: 'Fajr',
      times.sunrise: 'Sunrise',
      times.dhuhr: 'Dhuhr',
      times.asr: 'Asr',
      times.maghrib: 'Maghrib',
      times.isha: 'Isha',
    };

    return prayerNamesTimes[getNextPrayerTime(times)]!;
  }
}
