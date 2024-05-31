
abstract class ServiceResult<T> {}

class Success<T> extends ServiceResult<T> {
  final T data;

  Success({required this.data});
}

class Error<T> extends ServiceResult {
  final String message;

  Error({required this.message});
}

