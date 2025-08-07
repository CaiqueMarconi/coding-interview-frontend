import 'package:coding_interview_frontend/app/exchange/domain/entities/exchange_rate_entity.dart';

class ExchangeRateMapper {
  static ExchangeRateEntity fromMap(Map<String, dynamic> map) {
    return ExchangeRateEntity(
      rate: map['data']['byPrice']['fiatToCryptoExchangeRate'],
      releaseTime: map['data']['byPrice']['offerMakerStats']['releaseTime'],
    );
  }
}
