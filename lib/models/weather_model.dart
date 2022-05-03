import 'package:weatherapp/models/city_model.dart';

class WeatherModel {
  WeatherModel({
    required this.weatherInfo,
    required this.time,
    required this.sunRise,
    required this.sunSet,
    required this.timezoneName,
    required this.parent,
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.lattLong,
    required this.timezone,
  });
  late final List<WeatherInfoModel> weatherInfo;
  late final String time;
  late final String sunRise;
  late final String sunSet;
  late final String timezoneName;
  late final CityModel parent;
  late final String title;
  late final String locationType;
  late final int woeid;
  late final String lattLong;
  late final String timezone;

  WeatherModel.fromJson(Map<String, dynamic> json) {
    weatherInfo = List.from(json['consolidated_weather'])
        .map((e) => WeatherInfoModel.fromJson(e))
        .toList();
    time = json['time'];
    sunRise = json['sun_rise'];
    sunSet = json['sun_set'];
    timezoneName = json['timezone_name'];
    parent = CityModel.fromJson(json['parent']);
    title = json['title'];
    locationType = json['location_type'];
    woeid = json['woeid'];
    lattLong = json['latt_long'];
    timezone = json['timezone'];
  }
}

class WeatherInfoModel {
  WeatherInfoModel({
    required this.id,
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.windDirectionCompass,
    required this.created,
    required this.applicableDate,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.windSpeed,
    required this.windDirection,
    required this.airPressure,
    required this.humidity,
    required this.visibility,
    required this.predictability,
  });
  late final int id;
  late final String weatherStateName;
  late final String weatherStateAbbr;
  late final String windDirectionCompass;
  late final String created;
  late final String applicableDate;
  late final double minTemp;
  late final double maxTemp;
  late final double theTemp;
  late final double windSpeed;
  late final double? windDirection;
  late final double? airPressure;
  late final int humidity;
  late final double visibility;
  late final int predictability;

  WeatherInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    weatherStateName = json['weather_state_name'];
    weatherStateAbbr = json['weather_state_abbr'];
    windDirectionCompass = json['wind_direction_compass'];
    created = json['created'];
    applicableDate = json['applicable_date'];
    minTemp = json['min_temp'];
    maxTemp = json['max_temp'];
    theTemp = json['the_temp'];
    windSpeed = json['wind_speed'];
    windDirection = json['wind_direction'];
    airPressure = json['air_pressure'];
    humidity = json['humidity'];
    visibility = json['visibility'];
    predictability = json['predictability'];
  }
}
