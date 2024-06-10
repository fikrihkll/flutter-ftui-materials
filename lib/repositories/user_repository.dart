import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hello_world/models/remote/api_result.dart';
import 'package:hello_world/models/remote/user_response.dart';
import 'package:hello_world/utils/remote_helper.dart';
import 'package:hello_world/utils/shared_preference_helper.dart';

class UserRepository {

  final Dio dio;
  final FlutterSecureStorage sharedPreference;
  UserRepository(this.dio, this.sharedPreference);

  Future<ApiResult<UserResponse>> login(String email, String password) async {
    try {
      var requestBody = {
        "username": email,
        "password": password
      };
      var jsonResult = await dio
          .post("auth/login", data: requestBody);
      var userData = UserResponse.fromJson(jsonResult.data);
      await _saveLoginData(userData.token);
      RemoteHelper.setToken(userData.token);

      return ApiResult(data: userData);
    } on DioException catch(e) {
      try {
        return ApiResult(
            isSuccess: false,
            message: (e.response?.data as Map<String, dynamic>)["message"] ?? ""
        );
      } catch(e) {
        return ApiResult(isSuccess: false, message: e.toString());
      }
    } on Exception catch(e) {
      debugPrint("Er ${e}");
      return ApiResult(isSuccess: false, message: e.toString());
    }
  }

  Future<ApiResult<UserResponse>> getUserProfile() async {
    try {
      var jsonResult = await dio.get("auth/me");

      var userData = UserResponse.fromJson(jsonResult.data);
      return ApiResult(data: userData);
    } on DioException catch(e) {
      return ApiResult(
          isSuccess: false,
          message: (e.response?.data as Map<String, dynamic>)["message"] ?? ""
      );
    } on Exception catch(e) {
      return ApiResult(isSuccess: false, message: e.toString());
    }
  }

  Future<void> clearToken() async {
    await sharedPreference
        .delete(key: SharedPreferenceHelper.KEY_TOKEN);
  }

  Future<bool> tokenExist() async {
    String? token = await sharedPreference.read(key: SharedPreferenceHelper.KEY_TOKEN);
    if (token != null) {
      RemoteHelper.setToken(token);
      return true;
    } else {
      return false;
    }
  }

  Future<void> _saveLoginData(String token) async {
    await sharedPreference
        .write(key: SharedPreferenceHelper.KEY_TOKEN, value: token);
  }

}