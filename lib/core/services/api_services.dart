import 'package:app/core/constants/constants.dart';
import 'package:dio/dio.dart';

class ApiServices {
  Dio dio = Dio();
  ApiServices() {
    BaseOptions options = BaseOptions(baseUrl: kBaseUrl);
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
