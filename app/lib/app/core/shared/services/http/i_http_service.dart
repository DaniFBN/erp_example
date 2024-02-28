abstract class IHttpService {
  Future<HttpResponse> get(String url);
  Future<HttpResponse> post(String url, Map<String, dynamic> data);
  Future<HttpResponse> put(String url, Map<String, dynamic> data);
  Future<HttpResponse> patch(String url, Map<String, dynamic> data);
  Future<HttpResponse> delete(String url);
}

class HttpService implements IHttpService {
  @override
  Future<HttpResponse> delete(String url) {
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> get(String url) async {
    return const HttpResponse(data: [], statusCode: 200);
  }

  @override
  Future<HttpResponse> patch(String url, Map<String, dynamic> data) {
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> post(String url, Map<String, dynamic> data) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> put(String url, Map<String, dynamic> data) {
    // TODO: implement put
    throw UnimplementedError();
  }
}

class HttpResponse {
  final dynamic data;
  final int statusCode;

  const HttpResponse({
    required this.data,
    required this.statusCode,
  });
}
