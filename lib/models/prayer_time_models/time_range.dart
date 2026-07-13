class TimeRange {
  final String? start;
  final String? end;

  TimeRange({this.start, this.end});

  factory TimeRange.fromJson(Map<String, dynamic> json) {
    return TimeRange(
      start: json['start'],
      end: json['end'],
    );
  }
}
