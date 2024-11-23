import 'package:dio/dio.dart';

class DioService {
  Dio getDioInstance() {
    final dio = Dio();
    dio.options.baseUrl = 'https://nebot.synked.cloud/api/';
    return dio;
  }
}
