import 'package:coding_interview_frontend/app/core/shared/services/http_service/i_http_service.dart';
import 'package:coding_interview_frontend/app/core/utils/constants.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/exchange_rate_entity.dart';
import 'package:coding_interview_frontend/app/exchange/domain/helpers/get_exchange_rate_params.dart';
import 'package:coding_interview_frontend/app/exchange/external/mappers/exchange_rate_mapper.dart';
import 'package:coding_interview_frontend/app/exchange/infra/datasources/i_get_exchange_rate_datasource.dart';

class GetExchangeRateDatasource implements IGetExchangeRateDatasource {
  final IHttpService _httpService;

  GetExchangeRateDatasource({required IHttpService httpService})
    : _httpService = httpService;

  @override
  Future<ExchangeRateEntity> getExchangeRate(
    GetExchangeRateParams params,
  ) async {
    final response = await _httpService.get(
      url: Constants.baseUrl,
      queryParams: params.toQueryParams(),
    );
    final data = ExchangeRateMapper.fromMap(response.data);
    return data;
  }
}
