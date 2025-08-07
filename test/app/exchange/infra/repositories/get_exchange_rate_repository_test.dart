import 'package:coding_interview_frontend/app/core/failures/app_failure/i_app_failure.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/exchange_rate_entity.dart';
import 'package:coding_interview_frontend/app/exchange/infra/datasources/i_get_exchange_rate_datasource.dart';
import 'package:coding_interview_frontend/app/exchange/infra/repositories/get_exchange_rate_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/usecases/get_exchange_rate/app_failure_mock.dart';
import '../../exchange_mock/exchange_mock.dart';

class DatasourceMock extends Mock implements IGetExchangeRateDatasource {}

void main() {
  final datasource = DatasourceMock();
  final repository = GetExchangeRateRepository(datasource);
  test('Get Exchange Rate Repository Success...', () async {
    when(
      () => datasource.getExchangeRate(ExchangeMock.getExchangeRateParamMock),
    ).thenAnswer((_) async => ExchangeMock.exchangeRateMock);
    final result = await repository.getExchangeRate(
      ExchangeMock.getExchangeRateParamMock,
    );
    expect(result.fold((l) => l, (r) => r), isA<ExchangeRateEntity>());
  });

  test('Get Exchange Rate Repository Failure...', () async {
    when(
      () => datasource.getExchangeRate(ExchangeMock.getExchangeRateParamMock),
    ).thenThrow(appFailureMock);
    final result = await repository.getExchangeRate(
      ExchangeMock.getExchangeRateParamMock,
    );
    expect(result.fold((l) => l, (r) => r), isA<IAppFailure>());
  });
}
