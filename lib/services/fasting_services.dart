import 'package:athan_app/models/fasting_models/fasting_params.dart';
import 'package:athan_app/models/fasting_models/fasting_response.dart';
import 'package:athan_app/utils/api_paths.dart';
import 'package:athan_app/utils/app_constants.dart';
import 'package:dio/dio.dart';

class FastingServices {
  final Dio dio = Dio();

  Future<FastingResponse> getFastingTime(FastingParams queryParams) async {
    try {
      dio.options.baseUrl = AppConstants.baseUrl;
      final response = await dio.get(
        ApiPaths.fastingTimeUrl,
        queryParameters: queryParams.toQueryParameters(),
      );

      if (response.statusCode == 200) {
        return FastingResponse.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}
