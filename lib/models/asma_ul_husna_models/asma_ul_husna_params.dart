import 'package:athan_app/models/enums/asma_language.dart';

class AsmaUlHusnaParams {
  final IslamicApiLanguage language;
  final String apiKey;

  AsmaUlHusnaParams({required this.language, required this.apiKey});

  Map<String, dynamic> toQueryParameters() {
    return {'language': language.code, 'api_key': apiKey};
  }
}
