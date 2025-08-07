abstract class CurrencyEntity {
  final String id;
  final String name;
  final String symbol;
  final String? iconPath;

  CurrencyEntity({
    required this.id,
    required this.name,
    required this.symbol,
    this.iconPath,
  });
}

class CryptoCurrencyEntity extends CurrencyEntity {
  CryptoCurrencyEntity({
    required super.id,
    required super.name,
    required super.symbol,
    super.iconPath,
  });
}

class FiatCurrencyEntity extends CurrencyEntity {
  FiatCurrencyEntity({
    required super.id,
    required super.name,
    required super.symbol,
    super.iconPath,
  });
}
