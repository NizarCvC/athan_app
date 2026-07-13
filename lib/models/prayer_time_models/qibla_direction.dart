class QiblaDirection {
  final double? degrees;
  final String? from;
  final bool? clockwise;

  QiblaDirection({this.degrees, this.from, this.clockwise});

  factory QiblaDirection.fromJson(Map<String, dynamic> json) {
    return QiblaDirection(
      degrees: (json['degrees'] as num?)?.toDouble(),
      from: json['from'],
      clockwise: json['clockwise'],
    );
  }
}
