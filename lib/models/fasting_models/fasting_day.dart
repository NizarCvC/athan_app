import 'package:athan_app/models/fasting_models/fasting_time.dart';

class FastingDay {
  final String? date;
  final String? hijri;
  final String? hijriReadable;
  final FastingTime? time;

  FastingDay({
    this.date,
    this.hijri,
    this.hijriReadable,
    this.time,
  });

  factory FastingDay.fromJson(Map<String, dynamic> json) {
    return FastingDay(
      date: json['date'],
      hijri: json['hijri'],
      hijriReadable: json['hijri_readable'],
      time: json['time'] != null ? FastingTime.fromJson(json['time']) : null,
    );
  }
}
