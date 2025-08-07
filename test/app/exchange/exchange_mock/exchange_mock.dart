import 'package:coding_interview_frontend/app/core/utils/cripto_currencies.dart';
import 'package:coding_interview_frontend/app/core/utils/fiat_currencies.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/exchange_rate_entity.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/exchange_response.dart';
import 'package:coding_interview_frontend/app/exchange/domain/helpers/get_exchange_rate_params.dart';

class ExchangeMock {
  static final getExchangeRateParamMock = GetExchangeRateParams(
    from: CryptoCurrencies.cryptoList.first,
    to: FiatCurrencies.fiatList.first,
    amount: 60,
  );

  static final exchangeResponseMock = ExchangeResponse(
    estimatedRate: '100',
    receive: '1000',
    estimatedTime: 10,
  );

  static final exchangeRateMock = ExchangeRateEntity(
    rate: '104',
    releaseTime: 10,
  );
}
