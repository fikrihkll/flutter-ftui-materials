import 'package:dio/dio.dart';
import 'package:hello_world/data/services/user_service.dart';
import 'package:hello_world/repositories/user_repository.dart';

class RemoteHelper {

  static Dio? _dio;

  static UserRepository getUserRepository() {
    UserService userService = UserService(_getDioConfig());
    return UserRepository(userService: userService);
  }

  static Dio _getDioConfig() {
    return _dio ??= Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));
  }

}