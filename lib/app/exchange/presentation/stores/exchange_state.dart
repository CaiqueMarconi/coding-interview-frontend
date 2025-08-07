import 'package:coding_interview_frontend/app/core/utils/cripto_currencies.dart';
import 'package:coding_interview_frontend/app/core/utils/fiat_currencies.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/currency_entity.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/exchange_response.dart';
import 'package:coding_interview_frontend/app/exchange/domain/helpers/get_exchange_rate_params.dart';

class ExchangeState {
  final GetExchangeRateParams getExchangeRateParams;
  final ExchangeResponse exchangeResponse;
  final CurrencyEntity selectedCurrency;

  factory ExchangeState.initial() {
    return ExchangeState(
      getExchangeRateParams: GetExchangeRateParams(
        from: CryptoCurrencies.cryptoList.first,
        to: FiatCurrencies.fiatList.first,
        amount: 0,
      ),
      exchangeResponse: ExchangeResponse(
        estimatedRate: '0.0',
        receive: '0.0',
        estimatedTime: 0,
      ),
      selectedCurrency: CryptoCurrencies.cryptoList.first,
    );
  }

  ExchangeState({
    required this.getExchangeRateParams,
    required this.exchangeResponse,
    required this.selectedCurrency,
  });

  ExchangeState copyWith({
    GetExchangeRateParams? getExchangeRateParams,
    ExchangeResponse? exchangeResponse,
    CurrencyEntity? selectedCurrency,
  }) {
    return ExchangeState(
      getExchangeRateParams:
          getExchangeRateParams ?? this.getExchangeRateParams,
      exchangeResponse: exchangeResponse ?? this.exchangeResponse,
      selectedCurrency: selectedCurrency ?? this.selectedCurrency,
    );
  }
}
