import 'package:ceremony/classes/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Cache {
  final _userData = const FlutterSecureStorage();

  Future hasToken() async {
    var has = await _userData.containsKey(key: 'token');
    if (has) {
      print('has token');
      return true;
    } else {
      return false;
    }
  }

  Future setToken(String token) async {
    await _userData.write(key: 'token', value: token);
    print('set');
  }

  Future deleteToken() async {
    await _userData.delete(key: 'token');
    print('delete');
  }

  Future<String> getToken() async {
    var token = await _userData.read(key: 'token');
    print('retrieving token');
    return token!;
  }
}
