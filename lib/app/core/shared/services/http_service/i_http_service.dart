import 'package:coding_interview_frontend/app/core/shared/services/http_service/helpers/http_request_params.dart';
import 'package:coding_interview_frontend/app/core/shared/services/http_service/helpers/http_request_response.dart';

abstract class IHttpService {
  Future<HttpRequestResponse<T>> get<T>({
    required String url,
    Map<String, dynamic>? queryParams,
    T Function(dynamic data)? fromJson,
  });

  Future<HttpRequestResponse<T>> post<T>({
    required String url,
    required HttpRequestParams params,
    T Function(dynamic data)? fromJson,
  });
}
