
import 'package:dio/dio.dart';
import 'package:weatherapp/constants/strings/http_constants.dart';

class DioClientNetwork {
  late Dio dio;
  initializeDioClientNetwork() async {
    dio = Dio();
    dio.options = setBaseOptions();
    dio.interceptors.add(LogInterceptor(
        request: true, responseBody: true, requestBody: true, error: true));
  }

  BaseOptions setBaseOptions() {
    return BaseOptions(
      connectTimeout: 60000,
      baseUrl: HTTPConstants.baseUrl,
    );
  }
}