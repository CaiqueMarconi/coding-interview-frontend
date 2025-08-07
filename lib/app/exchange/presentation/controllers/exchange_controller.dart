import 'package:coding_interview_frontend/app/core/theme/theme_manager/theme_manager.dart';
import 'package:coding_interview_frontend/app/core/theme/widgets/snackbar_custom_widget.dart';
import 'package:coding_interview_frontend/app/core/utils/cripto_currencies.dart';
import 'package:coding_interview_frontend/app/core/utils/fiat_currencies.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/currency_entity.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/exchange_response.dart';
import 'package:coding_interview_frontend/app/exchange/domain/helpers/get_exchange_rate_params.dart';
import 'package:coding_interview_frontend/app/exchange/presentation/stores/exchange_store.dart';
import 'package:flutter/widgets.dart';

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
  bool get isLoading => exchangeStore.isLoading;

  Future<void> getExchangeRate() async {
    await exchangeStore.getExchangeRate();
    if (_hasError()) return;
  }

  List<CurrencyEntity> getListCurrencies(BuildContext context) {
    if (selectedCurrency is CryptoCurrencyEntity) {
      return CryptoCurrencies.cryptoList;
    } else {
      return FiatCurrencies.fiatListL10n(context);
    }
  }

  void onUpdateCurrencyParam(bool isFrom, CurrencyEntity currency) {
    if (isFrom) {
      exchangeStore.onSelectFrom(currency);
    } else {
      exchangeStore.onSelectTo(currency);
    }
    _resetExchangeResponse();
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

  void invert() async {
    exchangeStore.invert();
    await exchangeStore.getExchangeRate();
  }

  void _resetExchangeResponse() {
    exchangeStore.resetExchangeResponse();
  }

  bool _hasError() {
    if (exchangeStore.hasError) {
      showSnackBarCustom(exchangeStore.error.message, color: ThemeManager.red);
      return true;
    } else {
      return false;
    }
  }
}
