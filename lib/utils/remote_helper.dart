import 'package:dio/dio.dart';
class RemoteHelper {

  static Dio? _dio;

  static Dio getDio() {
    return _dio ??= Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));
  }

}