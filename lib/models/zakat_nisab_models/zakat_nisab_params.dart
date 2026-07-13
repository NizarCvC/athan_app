import 'package:athan_app/models/enums/supported_currency.dart';
import 'package:athan_app/models/enums/zakat_standard.dart';
import 'package:athan_app/models/enums/zakat_unit.dart';

class ZakatNisabParams {
  final ZakatStandard? standard; 
  final SupportedCurrency currency; 
  final ZakatUnit unit;
  final String apiKey;

  ZakatNisabParams({
    required this.currency,
    required this.unit,
    required this.apiKey,
    this.standard,
  });

  Map<String, dynamic> toQueryParameters() {
    final queryParams = <String, dynamic>{
      'currency': currency.code,
      'unit': unit.value,
      'api_key': apiKey,
    };

    if (standard != null) {
      queryParams['standard'] = standard!.value;
    }

    return queryParams;
  }
}
