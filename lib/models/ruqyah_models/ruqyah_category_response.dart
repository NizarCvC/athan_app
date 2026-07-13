import 'package:athan_app/models/ruqyah_models/base_ruqyah_response.dart';
import 'package:athan_app/models/ruqyah_models/ruqyah_category_group.dart';

class RuqyahCategoryResponse extends BaseRuqyahResponse {
  final List<RuqyahCategoryGroup>? data;

  RuqyahCategoryResponse({super.code, super.status, super.message, this.data});

  factory RuqyahCategoryResponse.fromJson(Map<String, dynamic> json) {
    return RuqyahCategoryResponse(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      data: json['data'] != null && json['status'] == 'success'
          ? (json['data'] as List).map((i) => RuqyahCategoryGroup.fromJson(i)).toList()
          : null,
    );
  }
}
