import 'package:dio/dio.dart';

class ApiServices {
  final _dio = Dio();

  Future<Response> get({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response = await _dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }

  Future<Response> post({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    Response response = await _dio.post(
      url,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
      data: data,
    );
    return response;
  }
}
