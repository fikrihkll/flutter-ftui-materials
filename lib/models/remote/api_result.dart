class ApiResult<T> {
  final bool isSuccess;
  final String message;
  final T? data;

  ApiResult({this.isSuccess = true, this.message = "", this.data = null});
}