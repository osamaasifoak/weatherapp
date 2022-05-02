import 'package:flutter/material.dart';
import 'package:weatherapp/constants/colors/color_constants.dart';
import 'package:weatherapp/views/weather/components/search_component.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SearchCityComponent(),
            const SizedBox(height: 15),
            Text(
              "Friday",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: ColorConstants.black),
            ),
            const SizedBox(height: 15),
            
          ],
        ),
      ),
    );
  }
}
