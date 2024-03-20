import 'helpers/responses.dart';

class HttpData {
  final Map<String, dynamic> data;

  HttpData(this.data);
}

abstract class IHttpService {
  Future<HttpResponse> get(String url, {Map<String, dynamic>? queryParams});
  Future<HttpResponse> post(String url, {required Map<String, dynamic> data});
  Future<HttpResponse> post2(String url, {required HttpData data});
  Future<HttpResponse> put(String url, Map<String, dynamic> data);
  Future<HttpResponse> patch(String url, Map<String, dynamic> data);
  Future<HttpResponse> delete(String url);
}
