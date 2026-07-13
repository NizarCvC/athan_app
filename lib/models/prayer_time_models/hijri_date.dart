import 'package:athan_app/models/prayer_time_models/designation.dart';
import 'package:athan_app/models/prayer_time_models/month_info.dart';
import 'package:athan_app/models/prayer_time_models/weekday.dart';

class HijriDate {
  final String? date;
  final String? format;
  final String? day;
  final Weekday? weekday;
  final MonthInfo? month;
  final String? year;
  final Designation? designation;
  final List<dynamic>? holidays;
  final List<dynamic>? adjustedHolidays;
  final String? method;

  HijriDate({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.holidays,
    this.adjustedHolidays,
    this.method,
  });

  factory HijriDate.fromJson(Map<String, dynamic> json) {
    return HijriDate(
      date: json['date'],
      format: json['format'],
      day: json['day'],
      weekday: json['weekday'] != null ? Weekday.fromJson(json['weekday']) : null,
      month: json['month'] != null ? MonthInfo.fromJson(json['month']) : null,
      year: json['year']?.toString(),
      designation: json['designation'] != null ? Designation.fromJson(json['designation']) : null,
      holidays: json['holidays'],
      adjustedHolidays: json['adjustedHolidays'],
      method: json['method'],
    );
  }
}
