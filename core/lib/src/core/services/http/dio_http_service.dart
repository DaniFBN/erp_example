import 'dart:math';

import '../../enums/unit_measurement_enum.dart';
import 'helpers/responses.dart';
import 'i_http_service.dart';

class HttpService implements IHttpService {
  @override
  Future<HttpResponse> delete(String url) {
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> get(String url) async {
    final random = Random();

    return HttpResponse(
      statusCode: 200,
      data: List.generate(
        2000,
        (index) => {
          'id': index,
          'enterpriseId': index,
          'name': 'Ingredient $index',
          'description':
              'Description aigafiasg douahdoahdao sdhoashdaosdhosadhsa aiusp aisu aisua ipsuasiausoiaus baaposaps uapsu as asausaod hasodhaosdhao sidhaso idaoisdh $index',
          'price': random.nextDouble() * 30,
          'amount': index,
          'unitMeasurement': random.nextInt(UnitMeasurement.values.length),
        },
      ),
    );
  }

  @override
  Future<HttpResponse> patch(String url, Map<String, dynamic> data) {
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> post(
    String url, {
    required Map<String, dynamic> data,
  }) async {
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
