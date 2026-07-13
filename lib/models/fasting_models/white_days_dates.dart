class WhiteDaysDates {
  final String? day13;
  final String? day14;
  final String? day15;

  WhiteDaysDates({this.day13, this.day14, this.day15});

  factory WhiteDaysDates.fromJson(Map<String, dynamic> json) {
    return WhiteDaysDates(
      day13: json['13th'],
      day14: json['14th'],
      day15: json['15th'],
    );
  }
}
