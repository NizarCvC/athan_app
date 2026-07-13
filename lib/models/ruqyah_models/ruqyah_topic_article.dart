import 'package:athan_app/models/ruqyah_models/ruqyah_content_block.dart';

class RuqyahTopicArticle {
  final int? subId;
  final String? title;
  final String? sectionTitle;
  final String? category;
  final List<RuqyahContentBlock>? content;

  RuqyahTopicArticle({this.subId, this.title, this.sectionTitle, this.category, this.content});

  factory RuqyahTopicArticle.fromJson(Map<String, dynamic> json) {
    return RuqyahTopicArticle(
      subId: json['sub_id'],
      title: json['title'],
      sectionTitle: json['section_title'],
      category: json['category'],
      content: json['content'] != null
          ? (json['content'] as List).map((i) => RuqyahContentBlock.fromJson(i)).toList()
          : null,
    );
  }
}
