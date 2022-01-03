import 'dart:convert';

import 'package:dio/dio.dart';

const String baseURL = 'https://reqres.in';
final Dio dio = Dio(
  BaseOptions(
    baseUrl: baseURL,
    connectTimeout: 30000,
    sendTimeout: 30000,
  ),
);

class ApiClientResponse {
  Future<String?> sendLogin({String? email, String? password}) async {
    try {
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      Response response = await dio.post('/api/login',
          data: {
            'email': email,
            'password': password,
          },
          options: Options(headers: headers));

      if (response.statusCode == 200) {
        return json.encode(response.data['token']);
      } else if (response.statusCode == 400) {
        throw Exception();
      }
    } on DioError catch (e) {
      throw (e.toString());
    }
  }
}
