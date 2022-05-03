import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/components/error_component.dart';
import 'package:weatherapp/constants/colors/color_constants.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/network/api_response_states.dart';
import 'package:weatherapp/utils/utils.dart';
import 'package:weatherapp/view_models/data/weather_view_model.dart';
import 'package:weatherapp/views/weather/components/search_component.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SearchCityComponent(),
            const SizedBox(height: 15),
            Expanded(
              child: SizedBox(
                height: _size.height,
                child: Consumer<WeatherViewModel>(
                  builder: (context, consumer, child) {
                    if (consumer.weatherResponse.status == Status.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (consumer.weatherResponse.status ==
                        Status.error) {
                      return ErrorComponent(
                          onTap: () {},
                          message: consumer.weatherResponse.message!);
                    } else {
                      WeatherModel weather = consumer.weatherResponse.data;

                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: weather.weatherInfo
                                .map(
                                  (e) => ClipRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5.0, sigmaY: 5.0),
                                      child: Container(
                                        decoration:  BoxDecoration(
                                            color: Colors.grey.shade200
                                                .withOpacity(0.1)),
                                        child: Column(
                                          children: [
                                            Text(
                                              Utils.getWeekDay(e.applicableDate),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                      color:
                                                          ColorConstants.black),
                                            ),
                                            SizedBox(
                                              width: 90,
                                              height: 70,
                                              child: Image(
                                                image: AssetImage(
                                                    'assets/${e.weatherStateName.toLowerCase().replaceAll(' ', '_')}.png'),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList()),
                      );
                      // return Text(
                      //   "Friday",
                      //   style: Theme.of(context)
                      //       .textTheme
                      //       .headline4
                      //       ?.copyWith(color: ColorConstants.black),
                      // );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
