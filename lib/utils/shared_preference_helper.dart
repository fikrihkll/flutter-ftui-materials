import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedPreferenceHelper {

  static FlutterSecureStorage? _storage;

  static String KEY_TOKEN = "token";

  static FlutterSecureStorage getInstance() {
    _storage ??= const FlutterSecureStorage();
    return _storage!;
  }

}