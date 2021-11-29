import 'package:dio/dio.dart';

const String baseURL = 'https://neo.trampill.com';
final Dio dio = Dio(
  BaseOptions(
    baseUrl: baseURL,
    connectTimeout: 30000,
    sendTimeout: 30000,
  ),
);

Future<bool?> sendLogin() async {
  try {
    Response response = await dio.post('api/token/');
  } catch (e) {
    throw (e.toString());
  }
}

Future<bool?> refreshToken() async {
  try {
    Response response = await dio.post('api/token/');
  } catch (e) {
    throw (e.toString());
  }
}
