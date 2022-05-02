import 'package:flutter/material.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/city_model.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/network/api_response_states.dart';
import 'package:weatherapp/view_models/repository/remote/weather_repository.dart';

class WeatherViewModel extends ChangeNotifier {
  late ConsolidatedWeatherModel _selectedWeather;
  ConsolidatedWeatherModel get selectedWeather => _selectedWeather;
  set setSelectedWeather(ConsolidatedWeatherModel selectedWeather) {
    _selectedWeather = selectedWeather;
    notifyListeners();
  }

  ApiResponse _cityResponse = ApiResponse.loading();
  ApiResponse get cityResponse => _cityResponse;
  set setCityResponse(ApiResponse cityResponse) {
    _cityResponse = cityResponse;
  }

  ApiResponse _weatherResponse = ApiResponse.loading();
  ApiResponse get weatherResponse => _weatherResponse;
  set setWeatherResponse(ApiResponse weatherResponse) {
    _weatherResponse = weatherResponse;
    notifyListeners();
  }

  Future<void> searchCity(String cityName) async {
    setCityResponse = ApiResponse.loading();
    try {
      var res = await serviceLocatorInstance<WeatherRepository>()
          .searchCity(cityName);
      if (res.isNotEmpty) {
        CityModel city = CityModel.fromJson(res[0]);
        await fetchWeather(city.woeid);
        setCityResponse = ApiResponse.completed(city);
      } else {
        setCityResponse = ApiResponse.completed(null);
      }
    } catch (e) {
      setCityResponse = ApiResponse.error(e.toString());
    }
  }

  Future<void> fetchWeather(int woeid) async {
    setWeatherResponse = ApiResponse.loading();
    try {
      var res =
          await serviceLocatorInstance<WeatherRepository>().fetchWeather(woeid);
      WeatherModel weatherModel = WeatherModel.fromJson(res);
      setSelectedWeather = weatherModel.consolidatedWeather[0];
      setWeatherResponse = ApiResponse.completed(weatherModel);
    } catch (e) {
      setWeatherResponse = ApiResponse.error(e.toString());
    }
  }
}
