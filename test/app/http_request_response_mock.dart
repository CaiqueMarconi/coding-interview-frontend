import 'package:coding_interview_frontend/app/core/shared/services/http_service/helpers/http_request_response.dart';

final httpRequestResponse = HttpRequestResponse.success({
  'data': {
    'byPrice': {
      'fiatToCryptoExchangeRate': '104',
      'offerMakerStats': {'releaseTime': 10.2},
    },
  },
});
