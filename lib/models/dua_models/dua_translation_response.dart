import 'package:athan_app/models/dua_models/base_dua_response.dart';
import 'package:athan_app/models/dua_models/dua_translation.dart';

class DuaTranslationResponse extends BaseDuaResponse {
  final List<DuaTranslation>? dataList;
  final DuaTranslation? singleData;  

  DuaTranslationResponse({super.code, super.status, super.message, this.dataList, this.singleData});

  factory DuaTranslationResponse.fromJson(Map<String, dynamic> json) {
    List<DuaTranslation>? parsedList;
    DuaTranslation? parsedSingle;

    if (json['status'] == 'success' && json['data'] != null) {
      if (json['data'] is List) {
        parsedList = (json['data'] as List).map((i) => DuaTranslation.fromJson(i)).toList();
      } else if (json['data'] is Map<String, dynamic>) {
        parsedSingle = DuaTranslation.fromJson(json['data']);
      }
    }

    return DuaTranslationResponse(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      dataList: parsedList,
      singleData: parsedSingle,
    );
  }
}
