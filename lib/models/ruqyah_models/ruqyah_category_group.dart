import 'package:athan_app/models/ruqyah_models/ruqyah_subcategory.dart';

class RuqyahCategoryGroup {
  final String? title;
  final List<RuqyahSubcategory>? subcategories;

  RuqyahCategoryGroup({this.title, this.subcategories});

  factory RuqyahCategoryGroup.fromJson(Map<String, dynamic> json) {
    return RuqyahCategoryGroup(
      title: json['title'],
      subcategories: json['subcategories'] != null
          ? (json['subcategories'] as List).map((i) => RuqyahSubcategory.fromJson(i)).toList()
          : null,
    );
  }
}
