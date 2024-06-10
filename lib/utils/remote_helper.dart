import 'package:dio/dio.dart';
class RemoteHelper {

  static Dio? _dio;

  static Dio getDio() {
    return _dio ??= Dio(BaseOptions(baseUrl: "https://dummyjson.com/"));
  }

  static setToken(String token) {
    _dio?.options = BaseOptions(
      baseUrl: "https://dummyjson.com/",
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
      }
    );
  }

}