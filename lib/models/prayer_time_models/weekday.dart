class Weekday {
  final String? en;
  final String? ar;

  Weekday({this.en, this.ar});

  factory Weekday.fromJson(Map<String, dynamic> json) {
    return Weekday(
      en: json['en'],
      ar: json['ar'],
    );
  }
}
