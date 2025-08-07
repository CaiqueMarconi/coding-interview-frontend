import 'package:coding_interview_frontend/app/core/theme/images/image_manager.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/currency_entity.dart';

class FiatCurrencies {
  static final List<FiatCurrencyEntity> fiatList = [
    FiatCurrencyEntity(
      id: 'BRL',
      name: 'Real Brasileño',
      symbol: 'R\$',
      iconPath: ImageManager.brl,
    ),
    FiatCurrencyEntity(
      id: 'COP',
      name: 'Peso Colombianos',
      symbol: 'COL\$',
      iconPath: ImageManager.cop,
    ),
    FiatCurrencyEntity(
      id: 'PEN',
      name: 'Soles Peruanos',
      symbol: 'S/',
      iconPath: ImageManager.pen,
    ),
    FiatCurrencyEntity(
      id: 'VES',
      name: 'Bolívares',
      symbol: 'Bs',
      iconPath: ImageManager.ves,
    ),
  ];
}
