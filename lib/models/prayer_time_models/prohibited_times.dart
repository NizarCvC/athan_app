import 'package:athan_app/models/prayer_time_models/time_range.dart';

class ProhibitedTimes {
  final TimeRange? sunrise;
  final TimeRange? noon;
  final TimeRange? sunset;

  ProhibitedTimes({this.sunrise, this.noon, this.sunset});

  factory ProhibitedTimes.fromJson(Map<String, dynamic> json) {
    return ProhibitedTimes(
      sunrise: json['sunrise'] != null ? TimeRange.fromJson(json['sunrise']) : null,
      noon: json['noon'] != null ? TimeRange.fromJson(json['noon']) : null,
      sunset: json['sunset'] != null ? TimeRange.fromJson(json['sunset']) : null,
    );
  }
}
