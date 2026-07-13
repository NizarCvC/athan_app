import 'package:athan_app/models/ruqyah_models/ruqyah_simple_item.dart';

class RuqyahSubcategory {
  final String? subcategory;
  final String? subcategorySlug;
  final List<RuqyahSimpleItem>? ruqyah;

  RuqyahSubcategory({this.subcategory, this.subcategorySlug, this.ruqyah});

  factory RuqyahSubcategory.fromJson(Map<String, dynamic> json) {
    return RuqyahSubcategory(
      subcategory: json['subcategory'],
      subcategorySlug: json['subcategory-slug'],
      ruqyah: json['ruqyah'] != null
          ? (json['ruqyah'] as List).map((i) => RuqyahSimpleItem.fromJson(i)).toList()
          : null,
    );
  }
}
