import 'package:athan_app/models/zakat_nisab_models/metal_threshold.dart';

class NisabThresholds {
  final MetalThreshold? gold;
  final MetalThreshold? silver;

  NisabThresholds({this.gold, this.silver});

  factory NisabThresholds.fromJson(Map<String, dynamic> json) {
    return NisabThresholds(
      gold: json['gold'] != null ? MetalThreshold.fromJson(json['gold']) : null,
      silver: json['silver'] != null ? MetalThreshold.fromJson(json['silver']) : null,
    );
  }
}
