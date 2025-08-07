import 'package:coding_interview_frontend/app/exchange/domain/helpers/type_currency_enum.dart';

abstract class CurrencyEntity {
  final String id;
  final String title;
  final String name;
  final String symbol;
  final String? iconPath;
  final TypeCurrencyEnum typeCurrency;

  CurrencyEntity({
    required this.id,
    required this.title,
    required this.name,
    required this.symbol,
    this.iconPath,
    required this.typeCurrency,
  });
}

class CryptoCurrencyEntity extends CurrencyEntity {
  CryptoCurrencyEntity({
    required super.id,
    required super.title,
    required super.name,
    required super.symbol,
    super.iconPath,
    super.typeCurrency = TypeCurrencyEnum.crypto,
  });
}

class FiatCurrencyEntity extends CurrencyEntity {
  FiatCurrencyEntity({
    required super.id,
    required super.title,
    required super.name,
    required super.symbol,
    super.iconPath,
    super.typeCurrency = TypeCurrencyEnum.fiat,
  });
}
