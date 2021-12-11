import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String baseURL = 'https://neo.trampill.com';
final Dio dio = Dio(
  BaseOptions(
    baseUrl: baseURL,
    connectTimeout: 30000,
    sendTimeout: 30000,
  ),
);

class ApiClientResponse {
  Future<bool?> sendLogin({String? username, String? password}) async {
    try {
      Response response = await dio.post('/api/token/', data: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 200) {
        if (response.data == "refresh" && response.data == "access") {
          return response.data;
        }
      }
    } on DioError catch (e) {
      throw (e.toString());
    }
  }

  Future<void> registrasiUser(
      {String? username,
      String? password,
      String? confirmPass,
      String? email}) async {
    try {
      Response response = await dio.post('/api/register/', data: {
        'username': username,
        'password': password,
        'confirm_pass': confirmPass,
        'email': email,
      });

      return response.data;
    } catch (e) {
      throw (e.toString());
    }
  }
}
