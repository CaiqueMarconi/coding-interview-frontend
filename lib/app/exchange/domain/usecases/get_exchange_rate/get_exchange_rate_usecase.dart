import 'package:coding_interview_frontend/app/core/failures/app_failure/i_app_failure.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/exchange_rate_entity.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/exchange_response.dart';
import 'package:coding_interview_frontend/app/exchange/domain/helpers/get_exchange_rate_params.dart';
import 'package:coding_interview_frontend/app/exchange/domain/repositories/i_get_Exchange_rate_repository.dart';
import 'package:coding_interview_frontend/app/exchange/domain/usecases/get_exchange_rate/i_get_exchange_rate_usecase.dart';
import 'package:fpdart/fpdart.dart';

class GetExchangeRateUsecase implements IGetExchangeRateUsecase {
  final IGetExchangeRateRepository _repository;

  const GetExchangeRateUsecase(this._repository);
  @override
  Future<Either<IAppFailure, ExchangeResponse>> call(
    GetExchangeRateParams params,
  ) async {
    final result = await _repository.getExchangeRate(params);
    final fold = result.fold((l) => l, (r) => r);

    if (fold is IAppFailure) return Left(fold);
    final data = fold as ExchangeRateEntity;

    final rate = double.parse(data.rate);

    final value =
        params.resolveType() == 0 ? params.amount * rate : params.amount / rate;

    return Right(
      ExchangeResponse(
        estimatedRate: value.toStringAsFixed(2),
        receive: rate.toStringAsFixed(2),
        estimatedTime: data.releaseTime.round(),
      ),
    );
  }
}
