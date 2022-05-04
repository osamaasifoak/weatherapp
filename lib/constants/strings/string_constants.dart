class StringConstants {
  static const String appName = "Weather app";
  static const String enterCity = "Enter city";
  static const String humidity = "Humidity";
  static const String pressure = "Pressure";
  static const String wind = "Wind";
  static const String f = "℉";
  static const String c = "℃";
  static const String percipitation = "Percipitation";
  static const String kmHour = "Km/h";
  static const String welcomeText =
      "Write the name of city to know\n the weather in that city!";
  static String noDataText(cityName) =>
      "Oops, there's no data here for '$cityName', I'm really sorry!";
}
