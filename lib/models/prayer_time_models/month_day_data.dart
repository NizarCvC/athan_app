import 'package:athan_app/models/prayer_time_models/hijri_date.dart';
import 'package:athan_app/models/prayer_time_models/prayer_times.dart';
import 'package:athan_app/models/prayer_time_models/prohibited_times.dart';

class MonthDayData {
  final String? date;
  final PrayerTimes? times;
  final HijriDate? hijriDate;
  final ProhibitedTimes? prohibitedTimes;

  MonthDayData({this.date, this.times, this.hijriDate, this.prohibitedTimes});

  factory MonthDayData.fromJson(Map<String, dynamic> json) {
    return MonthDayData(
      date: json['date'],
      times: json['times'] != null ? PrayerTimes.fromJson(json['times']) : null,
      hijriDate: json['hijri_date'] != null ? HijriDate.fromJson(json['hijri_date']) : null,
      prohibitedTimes: json['prohibited_times'] != null ? ProhibitedTimes.fromJson(json['prohibited_times']) : null,
    );
  }
}
