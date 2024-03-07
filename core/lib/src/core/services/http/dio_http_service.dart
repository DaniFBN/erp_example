import 'dart:math';

import 'package:dio/dio.dart';

import '../../../../core.dart';
import 'helpers/exceptions.dart';
import 'helpers/responses.dart';
import 'interceptors/header_interceptor.dart';

class HttpService implements IHttpService {
  final Dio _dio;

  HttpService(this._dio) {
    _dio.interceptors.add(HeaderInterceptor());
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
    // try {
    //   final response = await _dio.post(url, data: data);
    //   return HttpResponse(
    //     data: response.data,
    //     statusCode: response.statusCode ?? 200,
    //   );
    // } on DioException catch (e) {
    //   throw AppHttpException(
    //     e.toString(),
    //     code: 'invalid-post',
    //     statusCode: e.response?.statusCode ?? 500,
    //   );
    // }

    await Future.delayed(const Duration(seconds: 2));

    return HttpResponse(
      statusCode: 200,
      data: {
        'id': Random().nextInt(9999),
        ...data,
      },
    );
  }

  @override
  Future<HttpResponse> put(String url, Map<String, dynamic> data) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
