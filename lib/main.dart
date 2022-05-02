import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/constants/strings/string_constants.dart';
import 'package:weatherapp/constants/theme/app_theme.dart';
import 'package:weatherapp/services/network/dio_api_services.dart';
import 'package:weatherapp/services/network/dio_client_network.dart';
import 'package:weatherapp/view_models/data/weather_view_model.dart';
import 'package:weatherapp/view_models/repository/remote/weather_repository.dart';
import 'package:weatherapp/views/weather/weather_view.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  setupDepedencies();
  await serviceLocatorInstance<DioClientNetwork>().initializeDioClientNetwork();
  runApp(const MyApp());
}

final serviceLocatorInstance = GetIt.instance;
void setupDepedencies() {
  serviceLocatorInstance
      .registerSingleton<DioClientNetwork>(DioClientNetwork());
  serviceLocatorInstance.registerLazySingleton(() => DioApiServices());
  serviceLocatorInstance.registerLazySingleton(() => WeatherRepository());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WeatherViewModel(),
        ),
      ],
      child: MaterialApp(
        title: StringConstants.appName,
        theme: appTheme(context),
        debugShowCheckedModeBanner: false,
        home: const WeatherView(),
      ),
    );
  }
}
