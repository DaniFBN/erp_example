import 'package:core/core.dart';
import 'package:dev_tools/dev_tools.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:packaging_module/src/domain/entities/packaging_entity.dart';
import 'package:packaging_module/src/domain/helpers/params/add_packaging_param.dart';
import 'package:packaging_module/src/domain/usecases/add_packaging_usecase.dart';

import '../../mocks.dart';

void main() {
  final repo = PackagingRepositoryMock();
  final sut = AddPackagingUsecase(repo);

  // Ciclo de vida do test(tearDown, setUp, tearDownAll, setUpAll)
  // Mocktail - verify().called(), verifyNever
  // any()/Fake
  // throwsA

  group('AddPackagingUsecase | Failure |', () {
    test(
      'deve retornar Failure quando o id da empresa for inválido porque ele é <= 0',
      () async {
        // Arrange
        const param = AddPackagingParam(
          enterpriseID: 0,
          name: 'asasa',
          description: 'asas',
          price: 12,
          amount: 12,
        );

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
      },
    );

    test(
      'deve retornar Failure quando o nome for inválido por estar vazio',
      () async {
        // Arrange
        const param = AddPackagingParam(
          enterpriseID: 2,
          name: '',
          description: 'as',
          price: 12,
          amount: 12,
        );

        // Act
        final response = await sut(param);

        // Assert
        expect(response, isA<Failure>());
      },
    );

    test(
      'deve retornar Failure quando o nome for inválido por não ter um espaço',
      () async {
        // Arrange
        const param = AddPackagingParam(
          enterpriseID: 2,
          name: 'Embalagem ',
          description: 'as',
          price: 12,
          amount: 12,
        );

        // Act
        final response = await sut(param);

        // Assert
        expect(response, isA<Failure>());
      },
    );

    test(
      'deve retornar Failure quando a descrição for inválido por estar vazia',
      () async {
        // Arrange
        const param = AddPackagingParam(
          enterpriseID: 2,
          name: 'Embalagem asas',
          description: '',
          price: 12,
          amount: 12,
        );

        // Act
        final response = await sut(param);

        // Assert
        expect(response, isA<Failure>());
      },
    );

    test(
      'deve retornar Failure quando o preço for inválido por estar zerado ou negativo',
      () async {
        // Arrange
        const param = AddPackagingParam(
          enterpriseID: 2,
          name: 'Embalagem asas',
          description: 'asasas',
          price: 0,
          amount: 12,
        );

        // Act
        final response = await sut(param);

        // Assert
        expect(response, isA<Failure>());
      },
    );

    test(
      'deve retornar Failure quando a quantidade for inválido por estar zerado ou negativo',
      () async {
        // Arrange
        const param = AddPackagingParam(
          enterpriseID: 2,
          name: 'Embalagem asas',
          description: 'asasas',
          price: 12,
          amount: 0,
        );

        // Act
        final response = await sut(param);

        // Assert
        expect(response, isA<Failure>());
      },
    );

    test(
      'deve retornar Failure quando o repository retornar Failure por algum motivo',
      () async {
        // Arrange
        const param = AddPackagingParam(
          enterpriseID: 2,
          name: 'Embalagem asas',
          description: 'asasas',
          price: 12,
          amount: 12,
        );

        when(() => repo.add(param))
            .thenAnswer((_) async => Failure(AppExceptionMock()));

        // Act
        final response = await sut(param);

        // Assert
        expect(response, isA<Failure>());
      },
    );
  });

  group('AddPackagingUsecase | Success |', () {
    test(
      'deve retornar uma Embalagem quando todos os dados forem válidos e o repository der certo',
      () async {
        // Arrange
        const param = AddPackagingParam(
          enterpriseID: 2,
          name: 'Embalagem asas',
          description: 'asasas',
          price: 12,
          amount: 12,
        );

        when(() => repo.add(param))
            .thenAnswer((_) async => Success(PackagingEntityMock()));

        // Act
        final response = await sut(param);

        // Assert
        expect(response, isA<Success>());
      },
    );
  });
}
