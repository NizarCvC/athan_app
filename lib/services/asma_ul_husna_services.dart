import 'package:athan_app/models/asma_ul_husna_models/asma_ul_husna_params.dart';
import 'package:athan_app/models/asma_ul_husna_models/asma_ul_husna_response.dart';
import 'package:athan_app/utils/api_paths.dart';
import 'package:athan_app/utils/app_constants.dart';
import 'package:dio/dio.dart';

class AsmaUlHusnaServices {
  final Dio dio = Dio();

  Future<AsmaUlHusnaResponse> getAsmaUlHusna(
    AsmaUlHusnaParams queryParams,
  ) async {
    try {
      dio.options.baseUrl = AppConstants.baseUrl;
      final response = await dio.get(
        ApiPaths.asmaUlHusnaUrl,
        queryParameters: queryParams.toQueryParameters(),
      );

      if (response.statusCode == 200) {
        return AsmaUlHusnaResponse.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}