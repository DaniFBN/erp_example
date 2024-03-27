import 'package:core/core.dart';
import 'package:dev_tools/dev_tools.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:packaging_module/src/crud/usecases/add_packaging_usecase.dart';
import 'package:packaging_module/src/domain/entities/packaging_entity.dart';

import '../../mocks.dart';

// SUT = System Under Test

void main() {
  final repo = PackagingRepositoryMock();
  final sut = AddPackagingUsecase(repo);
  final param = AddPackagingParamMock();

  // Roda antes da SUIT(main) de test
  setUpAll(() => print('SETUP-ALL'));

  // Roda antes de CADA test
  // Se a sua classe tem o risco de levar "lixo de um teste pro outro", então recrie ela no setUp
  setUp(() {
    print('SETUP');
    when(() => param.enterpriseID).thenReturn(1);
    when(() => param.name).thenReturn('Embalagem 30u');
    when(() => param.description).thenReturn('Desc');
    when(() => param.price).thenReturn(30);
    when(() => param.amount).thenReturn(30);
  });

  // Roda depois de CADA test
  // Se o seu mock tem o risco de levar "lixo de um teste pro outro", então reset ele no tearDown
  tearDown(() {
    reset(repo);
    reset(param);
    print('TEAR-DOWN');
  });

  // Roda depois da SUIT(main) de test
  tearDownAll(() => print('TEAR-DOWN-ALL'));

  group('AddPackagingUsecase | Failure |', () {
    test(
      'deve retornar Failure quando o id da empresa for inválido porque ele é <= 0',
      () async {
        // Arrange
        when(() => param.enterpriseID).thenReturn(0);

        // Act
        final response = await sut(param);

        // Assert

        // Exemplo didático
        expect(response.runtimeType, Failure<PackagingEntity>);

        // Matcher
        expect(response, isA<Failure>());

        final failure = response.fold(
          (value) => value,
          (value) => value,
        ) as AppException;
        expect(failure.code, equals('invalid-enterprise-code'));
        verifyZeroInteractions(repo);
      },
    );

    test(
      'deve retornar Failure quando o nome for inválido por estar vazio',
      () async {
        // Arrange
        when(() => param.name).thenReturn('');

        // Act
        final response = await sut(param);

        // Assert
        expect(response, isA<Failure>());
        verifyZeroInteractions(repo);
      },
    );

    test(
      'deve retornar Failure quando o nome for inválido por não ter um espaço',
      () async {
        // Arrange
        when(() => param.name).thenReturn('Embalagem ');

        // Act
        final response = await sut(param);

        // Assert
        expect(response, isA<Failure>());
        verifyZeroInteractions(repo);
      },
    );

    test(
      'deve retornar Failure quando a descrição for inválido por estar vazia',
      () async {
        // Arrange
        when(() => param.description).thenReturn('');

        // Act
        final response = await sut(param);

        // Assert
        expect(response, isA<Failure>());
        verifyZeroInteractions(repo);
      },
    );

    test(
      'deve retornar Failure quando o preço for inválido por estar zerado ou negativo',
      () async {
        // Arrange
        when(() => param.price).thenReturn(0);

        // Act
        final response = await sut(param);

        // Assert
        expect(response, isA<Failure>());
        verifyZeroInteractions(repo);
      },
    );

    test(
      'deve retornar Failure quando a quantidade for inválido por estar zerado ou negativo',
      () async {
        // Arrange
        when(() => param.amount).thenReturn(0);

        // Act
        final response = await sut(param);

        // Assert
        expect(response, isA<Failure>());
        verifyZeroInteractions(repo);
      },
    );

    test(
      'deve retornar Failure quando o repository retornar Failure por algum motivo',
      () async {
        // Arrange
        when(() => repo.create(param))
            .thenAnswer((_) async => Failure(AppExceptionMock()));

        // Act
        final response = await sut(param);

        // Assert
        expect(response, isA<Failure>());
        verify(() => repo.create(param)).called(1);
      },
    );
  });

  group('AddPackagingUsecase | Success |', () {
    test(
      'deve retornar uma Embalagem quando todos os dados forem válidos e o repository der certo',
      () async {
        // Arrange
        when(() => repo.create(param))
            .thenAnswer((_) async => Success(PackagingEntityMock()));

        // Act
        final response = await sut(param);

        // Assert
        expect(response, isA<Success>());
        verify(() => repo.create(param)).called(1);
      },
    );
  });
}
