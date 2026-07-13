import 'package:athan_app/models/ruqyah_models/base_ruqyah_response.dart';
import 'package:athan_app/models/ruqyah_models/ruqyah_instant_entry.dart';

class RuqyahInstantResponse extends BaseRuqyahResponse {
  final List<RuqyahInstantEntry>? dataList;
  final RuqyahInstantEntry? singleData;

  RuqyahInstantResponse({super.code, super.status, super.message, this.dataList, this.singleData});

  factory RuqyahInstantResponse.fromJson(Map<String, dynamic> json) {
    List<RuqyahInstantEntry>? parsedList;
    RuqyahInstantEntry? parsedSingle;

    if (json['status'] == 'success' && json['data'] != null) {
      if (json['data'] is List) {
        parsedList = (json['data'] as List).map((i) => RuqyahInstantEntry.fromJson(i)).toList();
      } else if (json['data'] is Map<String, dynamic>) {
        parsedSingle = RuqyahInstantEntry.fromJson(json['data']);
      }
    }

    return RuqyahInstantResponse(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      dataList: parsedList,
      singleData: parsedSingle,
    );
  }
}
