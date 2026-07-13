import 'package:athan_app/models/asma_ul_husna_models/asma_ul_husna_data.dart';

class AsmaUlHusnaResponse {
  final int? code;
  final String? status;
  final String? message;
  final AsmaUlHusnaData? data;

  AsmaUlHusnaResponse({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  factory AsmaUlHusnaResponse.fromJson(Map<String, dynamic> json) {
    return AsmaUlHusnaResponse(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      data: json['data'] != null && json['status'] == 'success'
          ? AsmaUlHusnaData.fromJson(json['data']) 
          : null,
    );
  }
}