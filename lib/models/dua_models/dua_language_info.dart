class DuaLanguageInfo {
  final String? name;
  final String? nameEn;

  DuaLanguageInfo({this.name, this.nameEn});

  factory DuaLanguageInfo.fromJson(Map<String, dynamic> json) {
    return DuaLanguageInfo(
      name: json['name'],
      nameEn: json['name_en'],
    );
  }
}
