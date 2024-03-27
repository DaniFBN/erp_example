import 'package:core/core.dart';
import 'package:dev_tools/dev_tools.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:packaging_module/src/data/mappers/packaging_mapper.dart';
import 'package:packaging_module/src/data/repositories/packaging_repository.dart';
import 'package:packaging_module/src/domain/helpers/params/add_packaging_param.dart';

import '../../mocks.dart';

void main() {
  final IHttpService http = HttpServiceMock();
  final sut = PackagingRepository(http);
  const enterpriseID = 30;

  setUpAll(() {
    registerFallbackValue(HttpDataFake());
  });

  tearDown(() {
    reset(http);
  });

  group(
    'PackagingRepository | getPackagingByEnterpriseID | Failure |',
    () {
      test('', () async {
        final exception = HttpExceptionMock();
        when(() => exception.statusCode).thenReturn(404);
        when(() => exception.message).thenReturn('Não foi encontrado');
        when(() => http.get('/packaging?enterprise=$enterpriseID'))
            .thenThrow(exception);

        final response = await sut.getPackagingByEnterpriseID(enterpriseID);

        expect(response, isA<Failure>());
      });

      test('Caso em que a mensagem é tratada de acordo com o statusCode',
          () async {
        final exception = HttpExceptionMock();
        when(() => exception.statusCode).thenReturn(404);
        when(() => http.get('/packaging?enterprise=$enterpriseID'))
            .thenThrow(exception);

        final response = await sut.getPackagingByEnterpriseID(enterpriseID);

        expect(response, isA<Failure>());
        final failure = response.fold(
          (value) => value,
          (value) => value,
        ) as AppException;

        expect(failure.message, 'Nenhuma embalagem encontrada');
      });
    },
  );

  group('PackagingRepository | add | Success |', () {
    test('as', () async {
      const param = AddPackagingParam(
        enterpriseID: 0,
        name: '',
        description: '',
        price: 0,
        amount: 1,
      );

      when(() => http.post2('/packaging', data: any(named: 'data'))).thenAnswer(
        (_) async {
          return HttpResponse(
            data: {...PackagingMapper.addToMap(param), 'id': 1},
            statusCode: 23,
          );
        },
      );

      final response = await sut.add(param);

      expect(response, isA<Success>());
    });
  });
}
