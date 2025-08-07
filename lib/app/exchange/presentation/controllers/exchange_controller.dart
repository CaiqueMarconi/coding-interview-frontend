import 'package:coding_interview_frontend/app/core/utils/cripto_currencies.dart';
import 'package:coding_interview_frontend/app/core/utils/fiat_currencies.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/currency_entity.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/exchange_response.dart';
import 'package:coding_interview_frontend/app/exchange/domain/helpers/get_exchange_rate_params.dart';
import 'package:coding_interview_frontend/app/exchange/presentation/stores/exchange_store.dart';

class ExchangeController {
  final ExchangeStore exchangeStore;

  ExchangeController(this.exchangeStore);

  // VARIABLES
  double get amount => exchangeStore.state.getExchangeRateParams.amount;
  CurrencyEntity get fromCurrency =>
      exchangeStore.state.getExchangeRateParams.from;
  CurrencyEntity get toCurrency => exchangeStore.state.getExchangeRateParams.to;
  GetExchangeRateParams get getExchangeRateParams =>
      exchangeStore.state.getExchangeRateParams;
  ExchangeResponse get exchangeResponse => exchangeStore.state.exchangeResponse;
  int get type => exchangeStore.state.getExchangeRateParams.resolveType();
  CurrencyEntity get selectedCurrency => exchangeStore.state.selectedCurrency;

  Future<void> getExchangeRate() async {
    await exchangeStore.getExchangeRate();
  }

  List<CurrencyEntity> getListCurrencies() {
    if (selectedCurrency is CryptoCurrencyEntity) {
      return CryptoCurrencies.cryptoList;
    } else {
      return FiatCurrencies.fiatList;
    }
  }

  void onUpdateCurrencyParam(bool isFrom, CurrencyEntity currency) {
    if (isFrom) {
      exchangeStore.onSelectFrom(currency);
    } else {
      exchangeStore.onSelectTo(currency);
    }
  }

  void onSelectCurrency(CurrencyEntity currency) {
    exchangeStore.onSelectCurrency(currency);
  }

  void onSelectFrom(CurrencyEntity currency) {
    exchangeStore.onSelectFrom(currency);
  }

  void onSelectTo(CurrencyEntity currency) {
    exchangeStore.onSelectTo(currency);
  }

  void onChangeAmount(double amount) {
    exchangeStore.onChangeAmount(amount);
  }

  void invert() {
    exchangeStore.invert();
  }

  void reset() {
    exchangeStore.reset();
  }
}
