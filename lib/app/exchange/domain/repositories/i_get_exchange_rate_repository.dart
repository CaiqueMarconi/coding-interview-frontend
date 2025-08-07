import '../../../core/failures/app_failure/i_app_failure.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/exchange_rate_entity.dart';
import 'package:coding_interview_frontend/app/exchange/domain/helpers/get_exchange_rate_params.dart';
import 'package:fpdart/fpdart.dart';

abstract class IGetExchangeRateRepository {
  Future<Either<IAppFailure, ExchangeRateEntity>> getExchangeRate(
    GetExchangeRateParams params,
  );
}
