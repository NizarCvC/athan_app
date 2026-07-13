import 'package:athan_app/models/prayer_time_models/designation.dart';
import 'package:athan_app/models/prayer_time_models/month_info.dart';
import 'package:athan_app/models/prayer_time_models/weekday.dart';

class GregorianDate {
  final String? date;
  final String? format;
  final String? day;
  final Weekday? weekday;
  final MonthInfo? month;
  final String? year;
  final Designation? designation;

  GregorianDate({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
  });

  factory GregorianDate.fromJson(Map<String, dynamic> json) {
    return GregorianDate(
      date: json['date'],
      format: json['format'],
      day: json['day'],
      weekday: json['weekday'] != null ? Weekday.fromJson(json['weekday']) : null,
      month: json['month'] != null ? MonthInfo.fromJson(json['month']) : null,
      year: json['year']?.toString(),
      designation: json['designation'] != null ? Designation.fromJson(json['designation']) : null,
    );
  }
}
