import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/constants/strings/string_constants.dart';
import 'package:weatherapp/services/network/api_response_states.dart';
import 'package:weatherapp/utils/utils.dart';
import 'package:weatherapp/view_models/data/weather_view_model.dart';

class SearchCityComponent extends StatelessWidget {
  const SearchCityComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 15,
          right: 15,
          top: Utils.getOrientation(context) == Orientation.landscape ? 15 : 0),
      child: Consumer<WeatherViewModel>(builder: (context, consumer, child) {
        return TextFormField(
          decoration: InputDecoration(
            hintText: StringConstants.enterCity,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 15,
                width: 15,
                child: Visibility(
                  visible: consumer.weatherResponse.status == Status.loading,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              ),
            ),
          ),
          onFieldSubmitted: (String? cityName) {
            if (cityName != null) {
              consumer.setCityName = cityName;
              consumer.searchCity(cityName);
            }
          },
        );
      }),
    );
  }
}
