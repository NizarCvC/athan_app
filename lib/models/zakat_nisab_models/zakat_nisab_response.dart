import 'package:athan_app/models/zakat_nisab_models/zakat_data.dart';

class ZakatNisabResponse {
  final int? code;
  final String? status;
  final String? calculationStandard;
  final String? currency;
  final String? weightUnit;
  final String? updatedAt;
  final String? message; 
  final ZakatData? data;

  ZakatNisabResponse({
    this.code,
    this.status,
    this.calculationStandard,
    this.currency,
    this.weightUnit,
    this.updatedAt,
    this.message,
    this.data,
  });

  factory ZakatNisabResponse.fromJson(Map<String, dynamic> json) {
    return ZakatNisabResponse(
      code: json['code'],
      status: json['status'],
      calculationStandard: json['calculation_standard'],
      currency: json['currency'],
      weightUnit: json['weight_unit'],
      updatedAt: json['updated_at'],
      message: json['message'],
      data: json['data'] != null && json['status'] == 'success'
          ? ZakatData.fromJson(json['data']) 
          : null,
    );
  }
}