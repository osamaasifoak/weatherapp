import 'package:weatherapp/constants/strings/http_constants.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/services/network/dio_api_services.dart';

class WeatherRepository {
  Future<dynamic> searchCity(String cityName) async {
    try {
      return await serviceLocatorInstance<DioApiServices>().getRequest(
          HTTPConstants.searchCity,
          queryParameters: {"query": cityName});
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> fetchWeather(int woeid) async {
    try {
      return await serviceLocatorInstance<DioApiServices>()
          .getRequest("${HTTPConstants.weather}/$woeid");
    } catch (e) {
      rethrow;
    }
  }
}
