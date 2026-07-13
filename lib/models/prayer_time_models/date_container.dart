import 'package:athan_app/models/prayer_time_models/gregorian_date.dart';
import 'package:athan_app/models/prayer_time_models/hijri_date.dart';

class DateContainer {
  final String? readable;
  final String? timestamp;
  final HijriDate? hijri;
  final GregorianDate? gregorian;

  DateContainer({this.readable, this.timestamp, this.hijri, this.gregorian});

  factory DateContainer.fromJson(Map<String, dynamic> json) {
    return DateContainer(
      readable: json['readable'],
      timestamp: json['timestamp'],
      hijri: json['hijri'] != null ? HijriDate.fromJson(json['hijri']) : null,
      gregorian: json['gregorian'] != null ? GregorianDate.fromJson(json['gregorian']) : null,
    );
  }
}
