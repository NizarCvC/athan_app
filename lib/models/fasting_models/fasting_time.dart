class FastingTime {
  final String? sahur;
  final String? iftar;
  final String? duration;

  FastingTime({this.sahur, this.iftar, this.duration});

  factory FastingTime.fromJson(Map<String, dynamic> json) {
    return FastingTime(
      sahur: json['sahur'],
      iftar: json['iftar'],
      duration: json['duration'],
    );
  }
}
