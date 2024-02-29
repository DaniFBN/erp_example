import 'helpers/responses.dart';

abstract class IHttpService {
  Future<HttpResponse> get(String url);
  Future<HttpResponse> post(String url, Map<String, dynamic> data);
  Future<HttpResponse> put(String url, Map<String, dynamic> data);
  Future<HttpResponse> patch(String url, Map<String, dynamic> data);
  Future<HttpResponse> delete(String url);
}
