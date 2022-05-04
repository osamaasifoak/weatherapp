import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/components/error_component.dart';
import 'package:weatherapp/constants/colors/color_constants.dart';
import 'package:weatherapp/constants/strings/asset_constants.dart';
import 'package:weatherapp/constants/strings/string_constants.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/network/api_response_states.dart';
import 'package:weatherapp/utils/utils.dart';
import 'package:weatherapp/view_models/data/weather_view_model.dart';
import 'package:weatherapp/views/weather/components/empty_screen_component.dart';
import 'package:weatherapp/views/weather/components/selected_weather_card_component.dart';
import 'package:weatherapp/views/weather/components/weather_card_component.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Consumer<WeatherViewModel>(
          builder: (context, consumer, child) {
            if (consumer.weatherResponse.status == Status.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (consumer.weatherResponse.status == Status.error) {
              return ErrorComponent(
                  onTap: () {
                    consumer.searchCity(consumer.cityName);
                  },
                  message: consumer.weatherResponse.message!);
            } else {
              if (consumer.weatherResponse.data == null) {
                return EmptyScreenComponent(
                  assetPath: AssetConstants.welcome,
                  text: StringConstants.noDataText(consumer.cityName),
                );
              } else if (consumer.weatherResponse.data is List) {
                return EmptyScreenComponent(
                  assetPath: AssetConstants.welcome,
                  text: StringConstants.welcomeText,
                );
              } else {
                WeatherModel weather = consumer.weatherResponse.data;
                if (Utils.getOrientation(context) == Orientation.landscape) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: RefreshIndicator(
                          color: ColorConstants.lightGrey,
                          onRefresh: () =>
                              consumer.searchCity(consumer.cityName),
                          child: SingleChildScrollView(
                            child: SelectedWeatherCardComponent(
                              weather: consumer.selectedWeather,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: WeatherCardComponent(
                                weather: weather,
                                onTap: (val) {
                                  consumer.setSelectedWeather = val;
                                }),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return RefreshIndicator(
                    onRefresh: () => consumer.searchCity(consumer.cityName),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SelectedWeatherCardComponent(
                            weather: consumer.selectedWeather,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: WeatherCardComponent(
                              weather: weather,
                              onTap: (val) {
                                consumer.setSelectedWeather = val;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }
            }
          },
        ),
      ),
    );
  }
}
