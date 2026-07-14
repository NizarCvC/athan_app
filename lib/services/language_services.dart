import 'package:athan_app/models/language_models/language_param.dart';
import 'package:athan_app/models/language_models/language_response.dart';
import 'package:athan_app/utils/api_paths.dart';
import 'package:athan_app/utils/app_constants.dart';
import 'package:dio/dio.dart';

class LanguageServices {
  final Dio dio = Dio();

  Future<LanguageResponse> getSupportedLanguages(LanguageParam queryParams) async {
    try {
      dio.options.baseUrl = AppConstants.baseUrl;
      final response = await dio.get(
        ApiPaths.duaUrl,
        queryParameters: queryParams.toQueryParameters(),
      );

      if (response.statusCode == 200) {
        return LanguageResponse.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}
