import 'package:auth_module/src/domain/responses/login_response.dart';
import 'package:auth_module/src/domain/stores/events/login_event.dart';
import 'package:auth_module/src/domain/stores/login_store.dart';
import 'package:auth_module/src/domain/stores/states/login_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dev_tools/dev_tools.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks.dart';

void main() {
  final repo = AuthRepositoryMock();
  late LoginStore sut;

  setUp(() {
    sut = LoginStore(repo);
  });

  tearDown(() {
    reset(repo);
  });

  group('Native |', () {
    test('Success', () async {
      when(() => repo.login('', ''))
          .thenAnswer((_) async => const Success(LoginResponse('')));

      expect(
        sut.stream,
        emitsInOrder([
          isA<LoadingLoginState>(),
          isA<SuccessLoginState>(),
        ]),
      );

      sut.add(const SubmitLoginEvent(email: '', password: ''));
    });

    test('Failure', () async {
      when(() => repo.login('', ''))
          .thenAnswer((_) async => Failure(AppExceptionMock()));

      expect(
        sut.stream,
        emitsInOrder([
          isA<LoadingLoginState>(),
          isA<ErrorLoginState>(),
        ]),
      );

      sut.add(const SubmitLoginEvent(email: '', password: ''));
    });
  });

  group('BlocTest |', () {
    blocTest(
      'Success',
      build: () {
        final repo = AuthRepositoryMock();
        final sut = LoginStore(repo);

        when(() => repo.login('', ''))
            .thenAnswer((_) async => const Success(LoginResponse('')));

        return sut;
      },
      act: (bloc) => bloc.add(const SubmitLoginEvent(email: '', password: '')),
      expect: () => [
        isA<LoadingLoginState>(),
        isA<SuccessLoginState>(),
      ],
    );

    blocTest(
      'Failure',
      build: () {
        final repo = AuthRepositoryMock();
        final sut = LoginStore(repo);

        when(() => repo.login('', ''))
            .thenAnswer((_) async => Failure(AppExceptionMock()));

        return sut;
      },
      act: (bloc) => bloc.add(const SubmitLoginEvent(email: '', password: '')),
      expect: () => [
        isA<LoadingLoginState>(),
        isA<ErrorLoginState>(),
      ],
    );
  });
}
