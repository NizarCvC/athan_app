import 'package:athan_app/models/dua_models/dua_category_response.dart';
import 'package:athan_app/models/language_models/language_response.dart';
import 'package:athan_app/models/dua_models/dua_params.dart';
import 'package:athan_app/models/dua_models/dua_sub_category_response.dart';
import 'package:athan_app/models/dua_models/dua_translation_response.dart';
import 'package:athan_app/utils/api_paths.dart';
import 'package:athan_app/utils/app_constants.dart';
import 'package:dio/dio.dart';

class DuaServices {
  final Dio dio = Dio();

  Future<DuaCategoryResponse> getDuaCategories(DuaParams queryParams) async {
    try {
      dio.options.baseUrl = AppConstants.baseUrl;
      final response = await dio.get(
        ApiPaths.duaUrl,
        queryParameters: queryParams.toQueryParameters(),
      );

      if (response.statusCode == 200) {
        return DuaCategoryResponse.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<DuaSubCategoryResponse> getDuaSubCategories(
    DuaParams queryParams,
  ) async {
    try {
      dio.options.baseUrl = AppConstants.baseUrl;
      final response = await dio.get(
        ApiPaths.duaUrl,
        queryParameters: queryParams.toQueryParameters(),
      );

      if (response.statusCode == 200) {
        return DuaSubCategoryResponse.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<DuaTranslationResponse> getDuaTranslation(
    DuaParams queryParams,
  ) async {
    try {
      dio.options.baseUrl = AppConstants.baseUrl;
      final response = await dio.get(
        ApiPaths.duaUrl,
        queryParameters: queryParams.toQueryParameters(),
      );

      if (response.statusCode == 200) {
        return DuaTranslationResponse.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<LanguageResponse> getDuaSupportedLanguages(
    DuaParams queryParams,
  ) async {
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
