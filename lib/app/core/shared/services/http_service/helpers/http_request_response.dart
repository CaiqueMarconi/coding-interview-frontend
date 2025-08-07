class HttpRequestResponse<T> {
  final T? data;
  final String? error;

  HttpRequestResponse._({this.data, this.error});

  factory HttpRequestResponse.success(T data) =>
      HttpRequestResponse._(data: data);

  factory HttpRequestResponse.failure(String message) =>
      HttpRequestResponse._(error: message);

  bool get isSuccess => error == null;
}
