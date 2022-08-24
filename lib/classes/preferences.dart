import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Cache {
  final _userData = const FlutterSecureStorage();

  Future hasToken() async {
    var has = await _userData.containsKey(key: 'token');
    if (has) {
      var gotToken = await _userData.read(key: 'token');
      if (gotToken != null) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future setToken(String token) async {
    await _userData.write(key: 'token', value: token);
  }

  Future deleteToken() async {
    await _userData.delete(key: 'token');
  }

  Future<String> getToken() async {
    var token = await _userData.read(key: 'token');
    return token!;
  }

  Future setFirstBoot() async {
    await _userData.write(key: 'ifFirst', value: 'false');
  }

  Future<bool> ifFirstBoot() async {
    var notInitBoot = await _userData.containsKey(key: 'ifFirst');
    if (notInitBoot) {
      var ifFirst = await _userData.read(key: 'ifFirst');
      if (ifFirst != null && ifFirst == 'false') {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }
}
