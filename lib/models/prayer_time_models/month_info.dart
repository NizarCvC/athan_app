class MonthInfo {
  final int? number;
  final String? en;
  final String? ar;
  final int? days;

  MonthInfo({this.number, this.en, this.ar, this.days});

  factory MonthInfo.fromJson(Map<String, dynamic> json) {
    return MonthInfo(
      number: json['number'],
      en: json['en'],
      ar: json['ar'],
      days: json['days'],
    );
  }
}
