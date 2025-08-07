import 'package:coding_interview_frontend/app/core/theme/images/image_manager.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/currency_entity.dart';

class CryptoCurrencies {
  static final List<CryptoCurrencyEntity> cryptoList = [
    CryptoCurrencyEntity(
      id: 'TATUM-TRON-USDT',
      name: 'Tether',
      symbol: 'USDT',
      iconPath: ImageManager.tatumUSDT,
    ),
  ];
}
