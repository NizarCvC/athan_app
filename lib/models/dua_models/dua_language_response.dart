import 'package:athan_app/models/dua_models/base_dua_response.dart';
import 'package:athan_app/models/dua_models/dua_language_info.dart';

class DuaLanguageResponse extends BaseDuaResponse {
  final Map<String, DuaLanguageInfo>? data;

  DuaLanguageResponse({super.code, super.status, super.message, this.data});

  factory DuaLanguageResponse.fromJson(Map<String, dynamic> json) {
    Map<String, DuaLanguageInfo>? parsedData;
    
    if (json['status'] == 'success' && json['data'] != null) {
      parsedData = {};
      (json['data'] as Map<String, dynamic>).forEach((key, value) {
        parsedData![key] = DuaLanguageInfo.fromJson(value);
      });
    }

    return DuaLanguageResponse(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      data: parsedData,
    );
  }
}