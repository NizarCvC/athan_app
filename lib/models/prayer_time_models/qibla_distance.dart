class QiblaDistance {
  final double? value;
  final String? unit;

  QiblaDistance({this.value, this.unit});

  factory QiblaDistance.fromJson(Map<String, dynamic> json) {
    return QiblaDistance(
      value: (json['value'] as num?)?.toDouble(),
      unit: json['unit'],
    );
  }
}
