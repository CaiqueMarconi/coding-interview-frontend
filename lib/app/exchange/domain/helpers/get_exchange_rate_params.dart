import 'package:coding_interview_frontend/app/exchange/domain/entities/currency_entity.dart';
import 'package:equatable/equatable.dart';

class GetExchangeRateParams extends Equatable {
  final CurrencyEntity from;
  final CurrencyEntity to;
  final double amount;

  const GetExchangeRateParams({
    required this.from,
    required this.to,
    required this.amount,
  });

  Map<String, dynamic> toQueryParams() {
    return {
      'type': resolveType(),
      'cryptoCurrencyId': _resolveCrypto().id,
      'fiatCurrencyId': _resolveFiat().id,
      'amount': amount,
      'amountCurrencyId': from.id,
    };
  }

  int resolveType() {
    return from is CryptoCurrencyEntity ? 0 : 1;
  }

  int resolveTypeTapped(bool isFrom) {
    return isFrom
        ? (from is CryptoCurrencyEntity ? 0 : 1)
        : (to is CryptoCurrencyEntity ? 0 : 1);
  }

  CryptoCurrencyEntity _resolveCrypto() {
    return from is CryptoCurrencyEntity
        ? from as CryptoCurrencyEntity
        : to as CryptoCurrencyEntity;
  }

  FiatCurrencyEntity _resolveFiat() {
    return from is FiatCurrencyEntity
        ? from as FiatCurrencyEntity
        : to as FiatCurrencyEntity;
  }

  GetExchangeRateParams copyWith({
    CurrencyEntity? from,
    CurrencyEntity? to,
    double? amount,
  }) {
    return GetExchangeRateParams(
      from: from ?? this.from,
      to: to ?? this.to,
      amount: amount ?? this.amount,
    );
  }

  GetExchangeRateParams invert() {
    return GetExchangeRateParams(from: to, to: from, amount: amount);
  }

  @override
  List<Object?> get props => [from, to, amount];
}
