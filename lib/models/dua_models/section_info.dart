class SectionInfo {
  final String? title;
  final String? description;
  final List<String>? items;

  SectionInfo({this.title, this.description, this.items});

  factory SectionInfo.fromJson(Map<String, dynamic> json) {
    return SectionInfo(
      title: json['title'],
      description: json['description'],
      items: (json['points'] as List?)?.map((e) => e.toString()).toList() ??
             (json['steps'] as List?)?.map((e) => e.toString()).toList(),
    );
  }
}
