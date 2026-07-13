import 'package:athan_app/models/fasting_models/white_days_dates.dart';

class WhiteDays {
  final String? status;
  final WhiteDaysDates? days;

  WhiteDays({this.status, this.days});

  factory WhiteDays.fromJson(Map<String, dynamic> json) {
    return WhiteDays(
      status: json['status'],
      days: json['days'] != null ? WhiteDaysDates.fromJson(json['days']) : null,
    );
  }
}
