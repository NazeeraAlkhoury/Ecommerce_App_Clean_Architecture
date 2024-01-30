import 'package:dio/dio.dart';

class DioHelper {
  final Dio _dio;

  DioHelper(this._dio);

  Future<Response> postData({
    required String path,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParams,
    String lang = 'en',
    String? token,
  }) async {
    _dio.options.headers = {
      'ContentType': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await _dio.post(
      path,
      data: data,
      queryParameters: queryParams,
    );
  }

  Future<Response> getData({
    required String path,
    Map<String, dynamic>? queryParams,
    String lang = 'en',
    String? token,
  }) async {
    _dio.options.headers = {
      'ContentType': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await _dio.get(
      path,
      queryParameters: queryParams,
    );
  }
}
