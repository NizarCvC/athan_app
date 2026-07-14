import 'package:athan_app/models/dua_models/dua_params.dart';
import 'package:athan_app/models/ruqyah_models/ruqyah_category_response.dart';
import 'package:athan_app/models/ruqyah_models/ruqyah_instant_response.dart';
import 'package:athan_app/models/ruqyah_models/ruqyah_topic_response.dart';
import 'package:athan_app/utils/api_paths.dart';
import 'package:athan_app/utils/app_constants.dart';
import 'package:dio/dio.dart';

class RuqyahServices {
  final Dio dio = Dio();

  Future<RuqyahCategoryResponse> getRuqyahCategories(
    DuaParams queryParams,
  ) async {
    try {
      dio.options.baseUrl = AppConstants.baseUrl;
      final response = await dio.get(
        ApiPaths.ruqyahUrl,
        queryParameters: queryParams.toQueryParameters(),
      );

      if (response.statusCode == 200) {
        return RuqyahCategoryResponse.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<RuqyahInstantResponse> getRuqyah(DuaParams queryParams) async {
    try {
      dio.options.baseUrl = AppConstants.baseUrl;
      final response = await dio.get(
        ApiPaths.ruqyahUrl,
        queryParameters: queryParams.toQueryParameters(),
      );

      if (response.statusCode == 200) {
        return RuqyahInstantResponse.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<RuqyahTopicResponse> getRuqyahTopic(DuaParams queryParams) async {
    try {
      dio.options.baseUrl = AppConstants.baseUrl;
      final response = await dio.get(
        ApiPaths.ruqyahUrl,
        queryParameters: queryParams.toQueryParameters(),
      );

      if (response.statusCode == 200) {
        return RuqyahTopicResponse.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}
