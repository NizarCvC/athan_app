class LanguageInfo {
  final String? name;
  final String? nameEn;

  LanguageInfo({this.name, this.nameEn});

  factory LanguageInfo.fromJson(Map<String, dynamic> json) {
    return LanguageInfo(name: json['name'], nameEn: json['name_en']);
  }
}
