import 'package:athan_app/models/enums/dua_request_type.dart';
import 'package:athan_app/models/enums/asma_language.dart';

class DuaParams {
  final DuaRequestType type; 
  final String apiKey; 
  final IslamicApiLanguage? lang;
  final int? duaId; 
  final bool? random; 

  DuaParams({
    required this.type,
    required this.apiKey,
    this.lang,
    this.duaId,
    this.random,
  }) : assert(
          type == DuaRequestType.language || lang != null,
          'Language code (lang) is required unless type is "language".',
        );

  Map<String, dynamic> toQueryParameters() {
    final queryParams = <String, dynamic>{
      'type': type.value,
      'api_key': apiKey,
    };

    if (type != DuaRequestType.language && lang != null) {
      queryParams['lang'] = lang!.code;
    }
    
    if (duaId != null) queryParams['dua_id'] = duaId.toString();
    if (random != null && random == true) queryParams['random'] = 'true';

    return queryParams;
  }
}
