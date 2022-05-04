import 'package:flutter/material.dart';
import 'package:weatherapp/constants/colors/color_constants.dart';
import 'package:weatherapp/constants/strings/asset_constants.dart';
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
          if (Utils.getOrientation(context) == Orientation.landscape)
            Row(
              children: [
                Flexible(flex: 4, child: maiCard(_size, sizedBoxH15, context)),
                const SizedBox(width: 10),
                Flexible(child: infoCard(context, _size)),
              ],
            )
          else
            Column(
              children: [
                sizedBoxH15,
                maiCard(_size, sizedBoxH15, context),
                sizedBoxH15,
                infoCard(context, _size),
              ],
            )
        ],
      ),
    );
  }

  Container infoCard(BuildContext context, Size _size) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      width: _size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.spaceBetween,
        direction: Utils.getOrientation(context) == Orientation.landscape
            ? Axis.vertical
            : Axis.horizontal,
        children: [
          _WeatherInfoCard(
              icon: AssetConstants.icLeaf,
              title: StringConstants.humidity,
              value: weather.humidity.toString()),
          _WeatherInfoCard(
              icon: AssetConstants.icMeter,
              title: StringConstants.pressure,
              value: weather.airPressure.toString()),
          _WeatherInfoCard(
              icon: AssetConstants.icWind,
              title: StringConstants.wind,
              value:
                  "${weather.windSpeed.toStringAsFixed(0)} ${StringConstants.kmHour}"),
        ],
      ),
    );
  }

  Container maiCard(Size _size, SizedBox sizedBoxH15, BuildContext context) {
    return Container(
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
    );
  }
}

class _WeatherInfoCard extends StatelessWidget {
  const _WeatherInfoCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
  }) : super(key: key);
  final String icon, title, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(
            icon,
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: ColorConstants.white, height: 1.3),
            ),
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ColorConstants.lightGrey, height: 1.3),
          ),
        ],
      ),
    );
  }
}
