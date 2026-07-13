class RuqyahInstantEntry {
  final int? id;
  final String? title;
  final String? introduction;
  final String? arabic;
  final String? transliteration;
  final String? translation;
  final String? reference;
  final String? category;
  final String? subCategory;

  RuqyahInstantEntry({
    this.id, this.title, this.introduction, this.arabic, this.transliteration,
    this.translation, this.reference, this.category, this.subCategory,
  });

  factory RuqyahInstantEntry.fromJson(Map<String, dynamic> json) {
    return RuqyahInstantEntry(
      id: json['id'],
      title: json['title'],
      introduction: json['introduction'],
      arabic: json['arabic'],
      transliteration: json['transliteration'],
      translation: json['translation'],
      reference: json['reference'],
      category: json['category'],
      subCategory: json['sub_category'],
    );
  }
}
