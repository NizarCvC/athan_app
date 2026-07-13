import 'package:athan_app/models/zakat_nisab_models/nisab_thresholds.dart';

class ZakatData {
  final NisabThresholds? nisabThresholds;
  final String? zakatRate;
  final String? notes;

  ZakatData({this.nisabThresholds, this.zakatRate, this.notes});

  factory ZakatData.fromJson(Map<String, dynamic> json) {
    return ZakatData(
      nisabThresholds: json['nisab_thresholds'] != null 
          ? NisabThresholds.fromJson(json['nisab_thresholds']) 
          : null,
      zakatRate: json['zakat_rate'],
      notes: json['notes'],
    );
  }
}
