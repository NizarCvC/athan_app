import 'package:athan_app/models/ruqyah_models/base_ruqyah_response.dart';
import 'package:athan_app/models/ruqyah_models/ruqyah_topic_article.dart';

class RuqyahTopicResponse extends BaseRuqyahResponse {
  final List<RuqyahTopicArticle>? dataList;
  final RuqyahTopicArticle? singleData;

  RuqyahTopicResponse({super.code, super.status, super.message, this.dataList, this.singleData});

  factory RuqyahTopicResponse.fromJson(Map<String, dynamic> json) {
    List<RuqyahTopicArticle>? parsedList;
    RuqyahTopicArticle? parsedSingle;

    if (json['status'] == 'success' && json['data'] != null) {
      if (json['data'] is List) {
        parsedList = (json['data'] as List).map((i) => RuqyahTopicArticle.fromJson(i)).toList();
      } else if (json['data'] is Map<String, dynamic>) {
        parsedSingle = RuqyahTopicArticle.fromJson(json['data']);
      }
    }

    return RuqyahTopicResponse(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      dataList: parsedList,
      singleData: parsedSingle,
    );
  }
}