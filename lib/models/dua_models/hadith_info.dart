class HadithInfo {
  final String? title;
  final String? arabic;
  final String? translation;

  HadithInfo({this.title, this.arabic, this.translation});

  factory HadithInfo.fromJson(Map<String, dynamic> json) {
    return HadithInfo(
      title: json['title'],
      arabic: json['arabic'],
      translation: json['translation'],
    );
  }
}
