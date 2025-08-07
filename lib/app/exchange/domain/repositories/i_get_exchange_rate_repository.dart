import 'package:fpdart/fpdart.dart';
import '../../../core/failures/app_failure/i_app_failure.dart';
import '../entities/exchange_rate_entity.dart';
import '../helpers/get_exchange_rate_params.dart';

abstract class IGetExchangeRateRepository {
  Future<Either<IAppFailure, ExchangeRateEntity>> getExchangeRate(
    GetExchangeRateParams params,
  );
}
