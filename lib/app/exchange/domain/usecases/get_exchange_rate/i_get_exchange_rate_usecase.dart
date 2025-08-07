import 'package:coding_interview_frontend/app/core/failures/app_failure/i_app_failure.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/exchange_response.dart';
import 'package:coding_interview_frontend/app/exchange/domain/helpers/get_exchange_rate_params.dart';
import 'package:fpdart/fpdart.dart';

abstract class IGetExchangeRateUsecase {
  Future<Either<IAppFailure, ExchangeResponse>> call(
    GetExchangeRateParams params,
  );
}
