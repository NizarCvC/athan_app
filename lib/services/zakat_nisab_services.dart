import 'package:athan_app/models/zakat_nisab_models/zakat_nisab_params.dart';
import 'package:athan_app/models/zakat_nisab_models/zakat_nisab_response.dart';
import 'package:athan_app/utils/api_paths.dart';
import 'package:athan_app/utils/app_constants.dart';
import 'package:dio/dio.dart';

class ZakatNisabServices {
  final Dio dio = Dio();

  Future<ZakatNisabResponse> getZakatNisabValues(
    ZakatNisabParams queryParams,
  ) async {
    try {
      dio.options.baseUrl = AppConstants.baseUrl;
      final response = await dio.get(
        ApiPaths.zakatNisabUrl,
        queryParameters: queryParams.toQueryParameters(),
      );

      if (response.statusCode == 200) {
        return ZakatNisabResponse.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}
