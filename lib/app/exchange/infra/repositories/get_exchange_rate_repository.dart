import 'package:coding_interview_frontend/app/core/failures/app_failure/app_failure.dart';
import 'package:coding_interview_frontend/app/core/failures/app_failure/i_app_failure.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/exchange_rate_entity.dart';
import 'package:coding_interview_frontend/app/exchange/domain/helpers/get_exchange_rate_params.dart';
import 'package:coding_interview_frontend/app/exchange/domain/repositories/i_get_Exchange_rate_repository.dart';
import 'package:coding_interview_frontend/app/exchange/infra/datasources/i_get_exchange_rate_datasource.dart';
import 'package:fpdart/fpdart.dart';

class GetExchangeRateRepository implements IGetExchangeRateRepository {
  final IGetExchangeRateDatasource _datasource;

  GetExchangeRateRepository(this._datasource);
  @override
  Future<Either<IAppFailure, ExchangeRateEntity>> getExchangeRate(
    GetExchangeRateParams params,
  ) async {
    try {
      final result = await _datasource.getExchangeRate(params);
      return Right(result);
    } on IAppFailure catch (e, s) {
      return Left(AppFailure(message: e.message, stackTrace: s));
    }
  }
}
