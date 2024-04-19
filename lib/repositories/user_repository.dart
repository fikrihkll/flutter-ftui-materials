import 'package:dio/dio.dart';
import 'package:hello_world/utils/remote_helper.dart';

class UserRepository {

  Future<Response?> getAllUsers() async {
    try {
      var data = await RemoteHelper.getDio()
          .get("users");
      return data;
    } on DioException catch(e) {
      return e.response;
    } on Exception catch(e) {
      return null;
    }
  }

  Future<Response?> getUserById(String userId) async {
    try {
      var data = await RemoteHelper.getDio()
          .get("users/$userId");
      return data;
    } on DioException catch(e) {
      return e.response;
    } on Exception catch(e) {
      return null;
    }
  }

}