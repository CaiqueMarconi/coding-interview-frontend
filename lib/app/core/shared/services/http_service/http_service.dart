import 'package:coding_interview_frontend/app/core/shared/services/http_service/helpers/http_request_params.dart';
import 'package:coding_interview_frontend/app/core/shared/services/http_service/helpers/http_request_response.dart';
import 'package:coding_interview_frontend/app/core/shared/services/http_service/i_http_service.dart';
import 'package:dio/dio.dart';

class HttpService implements IHttpService {
  final Dio _dio;

  HttpService(this._dio);

  @override
  Future<HttpRequestResponse<T>> get<T>({
    required String url,
    Map<String, dynamic>? queryParams,
    T Function(dynamic data)? fromJson,
  }) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParams);
      final parsed =
          fromJson != null ? fromJson(response.data) : response.data as T;
      return HttpRequestResponse.success(parsed);
    } catch (e) {
      return HttpRequestResponse.failure(e.toString());
    }
  }

  @override
  Future<HttpRequestResponse<T>> post<T>({
    required String url,
    required HttpRequestParams params,
    T Function(dynamic data)? fromJson,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: params.body,
        queryParameters: params.queryParams,
        options: Options(headers: params.headers),
      );
      final parsed =
          fromJson != null ? fromJson(response.data) : response.data as T;
      return HttpRequestResponse.success(parsed);
    } catch (e) {
      return HttpRequestResponse.failure(e.toString());
    }
  }
}
