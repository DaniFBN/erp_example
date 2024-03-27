import 'package:core/core.dart';
import 'package:dev_tools/dev_tools.dart';
import 'package:flutter_test/flutter_test.dart';

class SutRepository extends Repository {
  const SutRepository();
}

class AppExceptionMock extends Mock implements AppException {}

void main() {
  const sut = SutRepository();
  textContrastGuideline;

  group('Repository | Success |', () {
    test('asasas', () async {
      final response = await sut.execute<bool>(() => true);

      expect(response, isA<Success>());
    });
  });

  group('Repository | Failure |', () {
    test(
      'when callback throws an AppHttpException with statusCode 404 then notFoundMessage param should be Failure message',
      () async {
        final response = await sut.execute<bool>(
          notFoundMessage: 'Não encontrado',
          () {
            throw AppHttpException(
              'Whatever',
              statusCode: 404,
              code: 'whatever',
            );
          },
        );

        expect(response, isA<Failure>());

        final failure = response.fold(id, id) as AppException;
        expect(failure.code, 'whatever');
        expect(failure.message, 'Não encontrado');
      },
    );

    test(
      'when callback throws an AppHttpException with statusCode 404 and notFoundMessage is not received then message should be the same of throwed exception',
      () async {
        final response = await sut.execute<bool>(
          () {
            throw AppHttpException(
              'Whatever',
              statusCode: 404,
              code: 'whatever',
            );
          },
        );

        expect(response, isA<Failure>());

        final failure = response.fold(id, id) as AppException;
        expect(failure.code, 'whatever');
        expect(failure.message, 'Whatever');
      },
    );

    test(
      'when callback throws an AppHttpException and statusCode is not 404 should return the exception',
      () async {
        final exception = AppHttpException(
          'Whatever',
          statusCode: 400,
          code: 'whatever',
        );

        final response = await sut.execute<bool>(
          () => throw exception,
        );

        expect(response, isA<Failure>());

        final failure = response.fold(id, id) as AppException;
        expect(failure, exception);
      },
    );

    test(
      'asas',
      () async {
        final response = await sut.execute<bool>(
          () => throw AppExceptionMock(),
        );

        expect(response, isA<Failure>());
      },
    );

    test(
      'Deve manter a exceção lançada se o callback lançar algo que não seja herdado de AppException',
      () async {
        final response = sut.execute<bool>(() => throw Exception());

        expect(
          () async => await response,
          throwsA(isA<Exception>()),
        );
      },
    );
  });
}
