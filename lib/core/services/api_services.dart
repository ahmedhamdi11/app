import 'package:dio/dio.dart';

class ApiServices {
  Dio dio = Dio();
  ApiServices(String baseUrl) {
    BaseOptions options = BaseOptions(baseUrl: baseUrl);
    dio = Dio(options);
  }

  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response = await dio.get(
      endPoint,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }

  Future<Response> post({
    required String endPoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    Response response = await dio.post(
      endPoint,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
      data: data,
    );
    return response;
  }
}
