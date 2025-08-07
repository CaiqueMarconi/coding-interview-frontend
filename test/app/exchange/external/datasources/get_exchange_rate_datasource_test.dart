import 'package:coding_interview_frontend/app/core/shared/services/http_service/i_http_service.dart';
import 'package:coding_interview_frontend/app/core/utils/constants.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/exchange_rate_entity.dart';
import 'package:coding_interview_frontend/app/exchange/external/datasources/get_exchange_rate_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../http_request_response_mock.dart';
import '../../exchange_mock/exchange_mock.dart';

class IHttpServiceMock extends Mock implements IHttpService {}

void main() {
  final httpService = IHttpServiceMock();
  final datasource = GetExchangeRateDatasource(httpService: httpService);

  test('Get Exchange Rate Datasource Success...', () async {
    when(
      () => httpService.get(
        url: Constants.baseUrl,
        queryParams: ExchangeMock.getExchangeRateParamMock.toQueryParams(),
      ),
    ).thenAnswer((invocation) async => httpRequestResponse);
    final result = await datasource.getExchangeRate(
      ExchangeMock.getExchangeRateParamMock,
    );
    expect(result, isA<ExchangeRateEntity>());
  });
}
