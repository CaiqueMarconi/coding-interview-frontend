import 'package:coding_interview_frontend/app/core/theme/images/image_manager.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/currency_entity.dart';

class FiatCurrencies {
  static final List<FiatCurrencyEntity> fiatList = [
    FiatCurrencyEntity(
      id: 'BRL',
      name: 'Real Brasileiro',
      symbol: 'BRL',
      iconPath: ImageManager.brl,
    ),
    FiatCurrencyEntity(
      id: 'COP',
      name: 'Peso Colombiano',
      symbol: 'COP',
      iconPath: ImageManager.cop,
    ),
    FiatCurrencyEntity(
      id: 'PEN',
      name: 'Sol Peruano',
      symbol: 'PEN',
      iconPath: ImageManager.pen,
    ),
    FiatCurrencyEntity(
      id: 'VES',
      name: 'Bolívar Venezuelano',
      symbol: 'VES',
      iconPath: ImageManager.ves,
    ),
  ];
}
