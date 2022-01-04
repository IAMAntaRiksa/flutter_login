import 'package:dio/dio.dart';
import 'package:login_flutter/data/model/user_model.dart';

const String baseURL = 'https://reqres.in/';
final Dio dio = Dio(
  BaseOptions(
    baseUrl: baseURL,
    connectTimeout: 30000,
    sendTimeout: 30000,
  ),
);

class ApiClientResponse {
  Future<User?> sendLogin({String? email, String? password}) async {
    try {
      // Map<String, String> headers = {
      //   'Content-type': 'application/json',
      //   'Accept': 'application/json',
      // };
      Response response = await dio.post('api/login', data: {
        'email': email,
        'password': password,
      });
      User user = User.fromJson(response.data);
      return user;
      // // options: Options(headers: headers)
      // if (response.statusCode == 200) {
      //   return response.data['token'];
      // }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        print(e.response?.statusCode);
      } else {
        print(e.message);
        print(e.requestOptions);
      }
    }
  }
}
