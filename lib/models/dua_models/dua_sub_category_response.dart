import 'package:athan_app/models/dua_models/base_dua_response.dart';
import 'package:athan_app/models/dua_models/dua_sub_category.dart';

class DuaSubCategoryResponse extends BaseDuaResponse {
  final List<DuaSubCategory>? data;

  DuaSubCategoryResponse({super.code, super.status, super.message, this.data});

  factory DuaSubCategoryResponse.fromJson(Map<String, dynamic> json) {
    return DuaSubCategoryResponse(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      data: json['data'] != null && json['status'] == 'success'
          ? (json['data'] as List).map((i) => DuaSubCategory.fromJson(i)).toList()
          : null,
    );
  }
}
