import 'package:athan_app/models/language_models/language_info.dart';

class LanguageResponse {
  final int? code;
  final String? status;
  final String? message;
  final Map<String, LanguageInfo>? data;

  LanguageResponse({this.code, this.status, this.message, this.data});

  factory LanguageResponse.fromJson(Map<String, dynamic> json) {
    Map<String, LanguageInfo>? parsedData;

    if (json['status'] == 'success' && json['data'] != null) {
      parsedData = {};
      (json['data'] as Map<String, dynamic>).forEach((key, value) {
        parsedData![key] = LanguageInfo.fromJson(value);
      });
    }

    return LanguageResponse(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      data: parsedData,
    );
  }
}
