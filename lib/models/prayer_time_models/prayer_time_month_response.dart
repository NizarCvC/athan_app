import 'package:athan_app/models/prayer_time_models/month_day_data.dart';
import 'package:athan_app/models/prayer_time_models/qibla.dart';
import 'package:athan_app/models/prayer_time_models/timezone.dart';

class PrayerTimeMonthResponse {
  final int? code;
  final String? status;
  final String? message;
  final List<MonthDayData>? data;
  final Qibla? qibla;
  final Timezone? timezone;

  PrayerTimeMonthResponse({
    this.code,
    this.status,
    this.message,
    this.data,
    this.qibla,
    this.timezone,
  });

  factory PrayerTimeMonthResponse.fromJson(Map<String, dynamic> json) {
    return PrayerTimeMonthResponse(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      data: json['data'] != null && json['status'] == 'success'
          ? (json['data'] as List).map((i) => MonthDayData.fromJson(i)).toList()
          : null,
      qibla: json['qibla'] != null ? Qibla.fromJson(json['qibla']) : null,
      timezone: json['timezone'] != null ? Timezone.fromJson(json['timezone']) : null,
    );
  }
}
