import 'package:flutter/material.dart';
import 'package:weatherapp/constants/strings/string_constants.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/city_model.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/network/api_response_states.dart';
import 'package:weatherapp/view_models/repository/remote/weather_repository.dart';

class WeatherViewModel extends ChangeNotifier {
  String selectedTemperatureUnit = StringConstants.c;

  String _cityName = "";
  String get cityName => _cityName;
  set setCityName(String cityName) {
    _cityName = cityName;
    notifyListeners();
  }

  late WeatherInfoModel _selectedWeather;
  WeatherInfoModel get selectedWeather => _selectedWeather;
  set setSelectedWeather(WeatherInfoModel selectedWeather) {
    _selectedWeather = selectedWeather;
    notifyListeners();
  }

  ApiResponse _weatherResponse = ApiResponse.completed([]);
  ApiResponse get weatherResponse => _weatherResponse;
  set setWeatherResponse(ApiResponse weatherResponse) {
    _weatherResponse = weatherResponse;
    notifyListeners();
  }

  Future<void> searchCity(String cityName) async {
    setWeatherResponse = ApiResponse.loading();
    try {
      var res = await serviceLocatorInstance<WeatherRepository>()
          .searchCity(cityName);
      if (res.isNotEmpty) {
        CityModel city = CityModel.fromJson(res[0]);
        WeatherModel _weather = await fetchWeather(city.woeid);
        setSelectedWeather = _weather.weatherInfo[0];
        setWeatherResponse = ApiResponse.completed(_weather);
      } else {
        setWeatherResponse = ApiResponse.completed(null);
      }
    } catch (e) {
      setWeatherResponse = ApiResponse.error(e.toString());
    }
  }

  Future<WeatherModel> fetchWeather(int woeid) async {
    setWeatherResponse = ApiResponse.loading();
    try {
      var res =
          await serviceLocatorInstance<WeatherRepository>().fetchWeather(woeid);
      return WeatherModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  switchTemperatureUnit(String val) {
    selectedTemperatureUnit = val;
    if (selectedTemperatureUnit == StringConstants.c) {
      convertToCentigrade();
    } else {
      convertFarenhite();
    }

    notifyListeners();
  }

  convertToCentigrade() {
    _selectedWeather.theTemp = (_selectedWeather.theTemp - 32.0) * 5.0 / 9.0;
  }

  convertFarenhite() {
    _selectedWeather.theTemp = (_selectedWeather.theTemp * 9.0 / 5.0) + 32.0;
  }
}