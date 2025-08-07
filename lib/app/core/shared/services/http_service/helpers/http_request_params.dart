class HttpRequestParams {
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? queryParams;
  final Map<String, String>? headers;

  HttpRequestParams({this.body, this.queryParams, this.headers});
}
