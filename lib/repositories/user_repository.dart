import 'package:flutter/material.dart';
import 'package:hello_world/data/services/user_service.dart';
import 'package:hello_world/models/remote/user_response.dart';
import 'package:hello_world/models/request_result.dart';

class UserRepository {

  final UserService userService;
  UserRepository({required this.userService});

  Future<RequestResult<List<UserResponse>>> getAllUsers() async {
    try {
      var data = await userService.getAllUsers();
      debugPrint(data.toString());
      return RequestResult(isSuccess: true, data: data);
    } on Exception catch(e) {
      debugPrint(e.toString());
      return RequestResult(isSuccess: false, message: e.toString());
    }
  }

  Future<RequestResult<UserResponse>> getUserById(String userId) async {
    try {
      var data = await userService.getUserById(userId);
      return RequestResult(isSuccess: true, data: data);
    } on Exception catch(e) {
      return RequestResult(isSuccess: false, message: e.toString());
    }
  }

}