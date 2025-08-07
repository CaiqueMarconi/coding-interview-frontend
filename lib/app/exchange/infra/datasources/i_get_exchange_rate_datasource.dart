import 'package:coding_interview_frontend/app/exchange/domain/entities/exchange_rate_entity.dart';
import 'package:coding_interview_frontend/app/exchange/domain/helpers/get_exchange_rate_params.dart';

abstract class IGetExchangeRateDatasource {
  Future<ExchangeRateEntity> getExchangeRate(GetExchangeRateParams params);
}
