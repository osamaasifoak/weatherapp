
import 'package:flutter_test/flutter_test.dart';
import 'package:weatherapp/constants/strings/string_constants.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/network/dio_client_network.dart';
import 'package:weatherapp/view_models/data/weather_view_model.dart';

void main() async {
  setupDepedencies();
  await serviceLocatorInstance<DioClientNetwork>().initializeDioClientNetwork();
  final provider = WeatherViewModel();
  await provider.searchCity("Berlin");
  test('Fetch API data', () async {
    await provider.searchCity("Berlin");
    expect(provider.weatherResponse.data, isA<WeatherModel>());
  });

  test('Change temperature unit state', () {
    provider.switchTemperatureUnit(StringConstants.c);
    expect(provider.selectedTemperatureUnit, StringConstants.c);
  });
}
