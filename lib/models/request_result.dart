class RequestResult<T> {
  bool isSuccess;
  T? data;
  String message;

  RequestResult({
    required this.isSuccess,
    this.data,
    this.message = ""});
}