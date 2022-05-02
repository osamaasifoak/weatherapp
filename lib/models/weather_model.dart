import 'package:weatherapp/models/city_model.dart';

class WeatherModel {
  WeatherModel({
    required this.consolidatedWeather,
    required this.time,
    required this.sunRise,
    required this.sunSet,
    required this.timezoneName,
    required this.parent,
    required this.sources,
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.lattLong,
    required this.timezone,
  });
  late final List<ConsolidatedWeatherModel> consolidatedWeather;
  late final String time;
  late final String sunRise;
  late final String sunSet;
  late final String timezoneName;
  late final CityModel parent;
  late final List<Sources> sources;
  late final String title;
  late final String locationType;
  late final int woeid;
  late final String lattLong;
  late final String timezone;
  
  WeatherModel.fromJson(Map<String, dynamic> json){
    consolidatedWeather = List.from(json['consolidated_weather']).map((e)=>ConsolidatedWeatherModel.fromJson(e)).toList();
    time = json['time'];
    sunRise = json['sun_rise'];
    sunSet = json['sun_set'];
    timezoneName = json['timezone_name'];
    parent = CityModel.fromJson(json['parent']);
    sources = List.from(json['sources']).map((e)=>Sources.fromJson(e)).toList();
    title = json['title'];
    locationType = json['location_type'];
    woeid = json['woeid'];
    lattLong = json['latt_long'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['consolidated_weather'] = consolidatedWeather.map((e)=>e.toJson()).toList();
    _data['time'] = time;
    _data['sun_rise'] = sunRise;
    _data['sun_set'] = sunSet;
    _data['timezone_name'] = timezoneName;
    _data['parent'] = parent.toJson();
    _data['sources'] = sources.map((e)=>e.toJson()).toList();
    _data['title'] = title;
    _data['location_type'] = locationType;
    _data['woeid'] = woeid;
    _data['latt_long'] = lattLong;
    _data['timezone'] = timezone;
    return _data;
  }
}

class ConsolidatedWeatherModel {
  ConsolidatedWeatherModel({
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
  
  ConsolidatedWeatherModel.fromJson(Map<String, dynamic> json){
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

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['weather_state_name'] = weatherStateName;
    _data['weather_state_abbr'] = weatherStateAbbr;
    _data['wind_direction_compass'] = windDirectionCompass;
    _data['created'] = created;
    _data['applicable_date'] = applicableDate;
    _data['min_temp'] = minTemp;
    _data['max_temp'] = maxTemp;
    _data['the_temp'] = theTemp;
    _data['wind_speed'] = windSpeed;
    _data['wind_direction'] = windDirection;
    _data['air_pressure'] = airPressure;
    _data['humidity'] = humidity;
    _data['visibility'] = visibility;
    _data['predictability'] = predictability;
    return _data;
  }
}


class Sources {
  Sources({
    required this.title,
    required this.slug,
    required this.url,
    required this.crawlRate,
  });
  late final String title;
  late final String slug;
  late final String url;
  late final int crawlRate;
  
  Sources.fromJson(Map<String, dynamic> json){
    title = json['title'];
    slug = json['slug'];
    url = json['url'];
    crawlRate = json['crawl_rate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['slug'] = slug;
    _data['url'] = url;
    _data['crawl_rate'] = crawlRate;
    return _data;
  }
}