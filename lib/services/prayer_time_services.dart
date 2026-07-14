import 'package:athan_app/models/prayer_time_models/prayer_time_month_response.dart';
import 'package:athan_app/models/prayer_time_models/prayer_time_params.dart';
import 'package:athan_app/models/prayer_time_models/prayer_time_single_response.dart';
import 'package:athan_app/utils/api_paths.dart';
import 'package:athan_app/utils/app_constants.dart';
import 'package:dio/dio.dart';

class PrayerTimeServices {
  final Dio dio = Dio();

  Future<PrayerTimeSingleResponse> getDayPrayerTime(
    PrayerTimeParams queryParams,
  ) async {
    try {
      dio.options.baseUrl = AppConstants.baseUrl;
      final response = await dio.get(
        ApiPaths.prayerTimeUrl,
        queryParameters: queryParams.toQueryParameters(),
      );

      if (response.statusCode == 200) {
        return PrayerTimeSingleResponse.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<PrayerTimeMonthResponse> getMonthPrayerTimes(
    PrayerTimeParams queryParams,
  ) async {
    try {
      dio.options.baseUrl = AppConstants.baseUrl;
      final response = await dio.get(
        ApiPaths.prayerTimeUrl,
        queryParameters: queryParams.toQueryParameters(),
      );

      if (response.statusCode == 200) {
        return PrayerTimeMonthResponse.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}
