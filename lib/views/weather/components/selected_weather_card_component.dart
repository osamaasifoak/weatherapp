import 'package:flutter/material.dart';
import 'package:weatherapp/constants/colors/color_constants.dart';
import 'package:weatherapp/constants/strings/string_constants.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/utils/utils.dart';
import 'package:weatherapp/views/weather/components/search_component.dart';

class SelectedWeatherCardComponent extends StatelessWidget {
  const SelectedWeatherCardComponent({Key? key, required this.weather})
      : super(key: key);
  final WeatherInfoModel weather;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    const sizedBoxH15 = SizedBox(height: 15);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchCityComponent(),
          sizedBoxH15,
          Align(
            alignment: Alignment.center,
            child: Text(
              Utils.getWeekDay(weather.applicableDate),
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: ColorConstants.lightGrey),
            ),
          ),
          sizedBoxH15,
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg-map-new.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              width: _size.width,
              child: Column(
                children: [
                  sizedBoxH15,
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        weather.weatherStateName,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: ColorConstants.lightGrey),
                      ),
                    ),
                  ),
                  sizedBoxH15,
                  SizedBox(
                    width: 150,
                    height: 120,
                    child: Image(
                      image: AssetImage(
                          'assets/${weather.weatherStateName.toLowerCase().replaceAll(' ', '_')}.png'),
                    ),
                  ),
                  sizedBoxH15,
                  Text(
                    '${weather.theTemp.toStringAsFixed(0)}º',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: ColorConstants.lightGrey),
                  ),
                  sizedBoxH15,
                ],
              ),
            ),
          ),
          sizedBoxH15,
          _infoText(
              context, "${StringConstants.humidity}: ${weather.humidity} "),
          _infoText(
              context, "${StringConstants.pressure}: ${weather.airPressure} "),
          _infoText(context,
              "${StringConstants.wind}: ${weather.windSpeed.toStringAsFixed(0)} ${StringConstants.kmHour}"),
        ],
      ),
    );
  }

  Text _infoText(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headline6
          ?.copyWith(color: ColorConstants.lightGrey, height: 1.3),
    );
  }
}
