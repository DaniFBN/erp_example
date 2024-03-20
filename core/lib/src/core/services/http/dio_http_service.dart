import 'package:dio/dio.dart';

import '../../../../core.dart';
import 'interceptors/header_interceptor.dart';

class HttpService implements IHttpService {
  final Dio _dio;

  HttpService(this._dio) {
    _dio.interceptors.add(AuthInterceptor());
  }

  @override
  Future<HttpResponse> delete(String url) async {
    try {
      final response = await _dio.delete(url);
      return HttpResponse(
        data: response.data,
        statusCode: response.statusCode ?? 200,
      );
    } on DioException catch (e) {
      throw AppHttpException(
        e.toString(),
        code: 'invalid-delete',
        statusCode: e.response?.statusCode ?? 500,
      );
    }
  }

  @override
  Future<HttpResponse> get(
    String url, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParams,
      );

      final data = response.data;
      if (data is Map && data.containsKey('error')) {
        throw throw AppHttpException(
          data['error'],
          code: 'invalid-get',
          statusCode: 500,
        );
      }

      return HttpResponse(
        data: response.data,
        statusCode: response.statusCode ?? 200,
      );
    } on DioException catch (e) {
      print(e.message);
      if (e.message?.contains('XMLHttpRequest') ?? false) {
        throw CorsException('Cors Problems', code: 'cors');
      }

      throw AppHttpException(
        e.toString(),
        code: 'invalid-get',
        statusCode: e.response?.statusCode ?? 500,
      );
    }
  }

  @override
  Future<HttpResponse> patch(String url, Map<String, dynamic> data) async {
    try {
      final response = await _dio.patch(url, data: data);
      return HttpResponse(
        data: response.data,
        statusCode: response.statusCode ?? 200,
      );
    } on DioException catch (e) {
      throw AppHttpException(
        e.toString(),
        code: 'invalid-patch',
        statusCode: e.response?.statusCode ?? 500,
      );
    }
  }

  @override
  Future<HttpResponse> post(
    String url, {
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _dio.post(url, data: data);
      return HttpResponse(
        data: response.data,
        statusCode: response.statusCode ?? 200,
      );
    } on DioException catch (e) {
      throw AppHttpException(
        e.toString(),
        code: 'invalid-post',
        statusCode: e.response?.statusCode ?? 500,
      );
    }
  }

  @override
  Future<HttpResponse> put(String url, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put(url, data: data);
      return HttpResponse(
        data: response.data,
        statusCode: response.statusCode ?? 200,
      );
    } on DioException catch (e) {
      throw AppHttpException(
        e.toString(),
        code: 'invalid-put',
        statusCode: e.response?.statusCode ?? 500,
      );
    }
  }

  @override
  Future<HttpResponse> post2(String url, {required HttpData data}) {
    throw UnimplementedError();
  }
}
