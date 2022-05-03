import 'package:flutter/material.dart';
import 'package:weatherapp/constants/colors/color_constants.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/utils/utils.dart';

class WeatherCardComponent extends StatelessWidget {
  const WeatherCardComponent({Key? key, required this.weather})
      : super(key: key);
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    const sizedBoxH15 = SizedBox(height: 8);
    return SizedBox(
      width: double.infinity,
      height: 180,
      child: ListView(
          scrollDirection:
              Utils.getOrientation(context) == Orientation.landscape
                  ? Axis.vertical
                  : Axis.horizontal,
          children: weather.weatherInfo
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorConstants.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        sizedBoxH15,
                        Text(
                          Utils.getWeekDay(e.applicableDate),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: ColorConstants.lightGrey),
                        ),
                        sizedBoxH15,
                        SizedBox(
                          width: 90,
                          height: 70,
                          child: Image(
                            image: AssetImage(
                                'assets/${e.weatherStateName.toLowerCase().replaceAll(' ', '_')}.png'),
                          ),
                        ),
                        sizedBoxH15,
                        Flexible(
                          child: Text(
                            "${e.maxTemp.toStringAsFixed(0)}º}/${e.minTemp.toStringAsFixed(0)}º}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: ColorConstants.lightGrey),
                          ),
                        ),
                        sizedBoxH15,
                      ],
                    ),
                  ),
                ),
              )
              .toList()),
    );
  }
}
