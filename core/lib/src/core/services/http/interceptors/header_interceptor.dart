import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HeaderInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await FirebaseAuth.instance.currentUser?.getIdToken();
    print(token);

    options.headers.addAll({
      'Authorization': 'Bearer $token',
    });

    print(options.headers);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    print(err.requestOptions.path);

    super.onError(err, handler);
  }
}
