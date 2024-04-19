import 'package:dio/dio.dart';
import 'package:hello_world/models/remote/user_response.dart';
import 'package:retrofit/http.dart';

part 'user_service.g.dart';

@RestApi()
abstract class UserService {

  factory UserService(Dio dio) {
    return _UserService(dio);
  }
  
  @GET("users")
  Future<List<UserResponse>> getAllUsers();

  @GET("users/{user_id}")
  Future<UserResponse> getUserById(@Path("user_id") String userId);
  
}