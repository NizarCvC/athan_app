import 'package:athan_app/models/fasting_models/fasting_day.dart';
import 'package:athan_app/models/fasting_models/white_days.dart';

class FastingData {
  final List<FastingDay>? fasting;
  final WhiteDays? whiteDays;

  FastingData({this.fasting, this.whiteDays});

  factory FastingData.fromJson(Map<String, dynamic> json) {
    return FastingData(
      fasting: json['fasting'] != null 
          ? (json['fasting'] as List).map((i) => FastingDay.fromJson(i)).toList() 
          : null,
      whiteDays: json['white_days'] != null 
          ? WhiteDays.fromJson(json['white_days']) 
          : null,
    );
  }
}
