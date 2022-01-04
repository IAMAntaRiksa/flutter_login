import 'package:shared_preferences/shared_preferences.dart';

class Sharedprefrance {
  static const _keyToken = 'token';
  Future<String?> replacToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString(_keyToken);
  }

  Future<bool?> saveToken(String? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_keyToken, value ?? '');
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_keyToken);
  }
}
