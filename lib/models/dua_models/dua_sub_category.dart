class DuaSubCategory {
  final int? id;
  final String? title;
  final String? category;
  final List<int>? duaIds;

  DuaSubCategory({this.id, this.title, this.category, this.duaIds});

  factory DuaSubCategory.fromJson(Map<String, dynamic> json) {
    return DuaSubCategory(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      duaIds: json['dua-ids'] != null ? List<int>.from(json['dua-ids']) : null,
    );
  }
}
