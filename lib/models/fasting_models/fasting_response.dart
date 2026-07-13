import 'package:athan_app/models/fasting_models/fasting_data.dart';

class FastingResponse {
  final int? code;
  final String? status;
  final String? range; 
  final String? message;
  final FastingData? data;

  FastingResponse({
    this.code,
    this.status,
    this.range,
    this.message,
    this.data,
  });

  factory FastingResponse.fromJson(Map<String, dynamic> json) {
    return FastingResponse(
      code: json['code'],
      status: json['status'],
      range: json['range'],
      message: json['message'],
      data: json['data'] != null && json['status'] == 'success'
          ? FastingData.fromJson(json['data']) 
          : null,
    );
  }
}