import 'package:coding_interview_frontend/app/core/failures/app_failure/i_app_failure.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/exchange_response.dart';
import 'package:coding_interview_frontend/app/exchange/domain/repositories/i_get_Exchange_rate_repository.dart';
import 'package:coding_interview_frontend/app/exchange/domain/usecases/get_exchange_rate/get_exchange_rate_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'app_failure_mock.dart';
import '../../../exchange_mock/exchange_mock.dart';

class GetExchangeRateRepositoryMock extends Mock
    implements IGetExchangeRateRepository {}

void main() {
  final repository = GetExchangeRateRepositoryMock();
  final usecase = GetExchangeRateUsecase(repository);
  test('get exchange rate usecase success...', () async {
    when(
      () => repository.getExchangeRate(ExchangeMock.getExchangeRateParamMock),
    ).thenAnswer((invocation) async => Right(ExchangeMock.exchangeRateMock));
    final result = await usecase.call(ExchangeMock.getExchangeRateParamMock);
    expect(result.fold((l) => l, (r) => r), isA<ExchangeResponse>());
  });

  test('get exchange rate usecase failure...', () async {
    when(
      () => repository.getExchangeRate(ExchangeMock.getExchangeRateParamMock),
    ).thenAnswer((invocation) async => Left(appFailureMock));
    final result = await usecase.call(ExchangeMock.getExchangeRateParamMock);
    expect(result.fold((l) => l, (r) => r), isA<IAppFailure>());
  });
}
