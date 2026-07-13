import 'package:athan_app/models/prayer_time_models/date_container.dart';
import 'package:athan_app/models/prayer_time_models/prayer_times.dart';
import 'package:athan_app/models/prayer_time_models/prohibited_times.dart';
import 'package:athan_app/models/prayer_time_models/qibla.dart';
import 'package:athan_app/models/prayer_time_models/timezone.dart';

class SingleDayData {
  final PrayerTimes? times;
  final DateContainer? date;
  final Qibla? qibla;
  final ProhibitedTimes? prohibitedTimes;
  final Timezone? timezone;

  SingleDayData({
    this.times,
    this.date,
    this.qibla,
    this.prohibitedTimes,
    this.timezone,
  });

  factory SingleDayData.fromJson(Map<String, dynamic> json) {
    return SingleDayData(
      times: json['times'] != null ? PrayerTimes.fromJson(json['times']) : null,
      date: json['date'] != null ? DateContainer.fromJson(json['date']) : null,
      qibla: json['qibla'] != null ? Qibla.fromJson(json['qibla']) : null,
      prohibitedTimes: json['prohibited_times'] != null ? ProhibitedTimes.fromJson(json['prohibited_times']) : null,
      timezone: json['timezone'] != null ? Timezone.fromJson(json['timezone']) : null,
    );
  }
}
