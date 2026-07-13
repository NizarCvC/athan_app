import 'package:athan_app/models/dua_models/base_dua_response.dart';
import 'package:athan_app/models/dua_models/dua_category.dart';

class DuaCategoryResponse extends BaseDuaResponse {
  final List<DuaCategory>? data;

  DuaCategoryResponse({super.code, super.status, super.message, this.data});

  factory DuaCategoryResponse.fromJson(Map<String, dynamic> json) {
    return DuaCategoryResponse(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      data: json['data'] != null && json['status'] == 'success'
          ? (json['data'] as List).map((i) => DuaCategory.fromJson(i)).toList()
          : null,
    );
  }
}
