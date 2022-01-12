import 'package:dio/dio.dart';
import 'package:login_flutter/data/model/pendaftaran.dart';

const String baseURL = 'https://neo.trampill.com';
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
      Response response = await dio.post('/api/token/', data: {
        'username': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        return response.data['access'];
      }
    } on DioError catch (e) {
      e.toString();
      if (e.response?.statusCode == 401) {
        e.response?.statusCode;
      } else {
        e.message;
        e.requestOptions;
      }
    }
  }

  Future<List<Materi>?> pendaftaranMateri() async {
    try {
      Response response = await dio.get('/api/pendaftaran/');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((e) => Materi.fromJson(e)).toList();
      }
    } on DioError catch (e) {
      e.toString();
    }
  }
}
