import 'package:athan_app/models/prayer_time_models/single_day_data.dart';

class PrayerTimeSingleResponse {
  final int? code;
  final String? status;
  final String? message;
  final SingleDayData? data;

  PrayerTimeSingleResponse({this.code, this.status, this.message, this.data});

  factory PrayerTimeSingleResponse.fromJson(Map<String, dynamic> json) {
    return PrayerTimeSingleResponse(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      data: json['data'] != null && json['status'] == 'success' 
          ? SingleDayData.fromJson(json['data']) 
          : null,
    );
  }
}
