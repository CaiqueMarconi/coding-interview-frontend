import 'package:coding_interview_frontend/app/core/wrappers/triple/triple.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/currency_entity.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/exchange_response.dart';
import 'package:coding_interview_frontend/app/exchange/domain/usecases/get_exchange_rate/i_get_exchange_rate_usecase.dart';
import 'package:coding_interview_frontend/app/exchange/presentation/stores/exchange_state.dart';

final class ExchangeStore extends NewStore<ExchangeState> {
  final IGetExchangeRateUsecase _getExchangeRateUsecase;
  ExchangeStore({required IGetExchangeRateUsecase getExchangeRateUsecase})
    : _getExchangeRateUsecase = getExchangeRateUsecase,
      super(ExchangeState.initial());

  Future<void> getExchangeRate() async {
    setLoading(true);

    final response = await _getExchangeRateUsecase.call(
      state.getExchangeRateParams,
    );
    response.fold((l) => setError(error), (r) {
      update(state.copyWith(exchangeResponse: r));
    });
    setLoading(false);
  }

  void onSelectFrom(CurrencyEntity currency) {
    update(
      state.copyWith(
        getExchangeRateParams: state.getExchangeRateParams.copyWith(
          from: currency,
        ),
      ),
    );
  }

  void onSelectTo(CurrencyEntity currency) {
    update(
      state.copyWith(
        getExchangeRateParams: state.getExchangeRateParams.copyWith(
          to: currency,
        ),
      ),
    );
  }

  void onChangeAmount(double amount) {
    update(
      state.copyWith(
        getExchangeRateParams: state.getExchangeRateParams.copyWith(
          amount: amount,
        ),
      ),
    );
  }

  void invert() {
    final currentParams = state.getExchangeRateParams;
    update(state.copyWith(getExchangeRateParams: currentParams.invert()));
  }

  void resetExchangeResponse() {
    update(
      state.copyWith(
        exchangeResponse: ExchangeResponse(
          estimatedRate: '0.0',
          receive: '0.0',
          estimatedTime: 0,
        ),
      ),
    );
  }

  void onSelectCurrency(CurrencyEntity currency) {
    update(state.copyWith(selectedCurrency: currency));
  }
}
