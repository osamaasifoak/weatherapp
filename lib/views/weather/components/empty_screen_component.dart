import 'package:flutter/material.dart';
import 'package:weatherapp/constants/colors/color_constants.dart';
import 'package:weatherapp/constants/strings/string_constants.dart';
import 'package:weatherapp/views/weather/components/search_component.dart';

class EmptyScreenComponent extends StatelessWidget {
  const EmptyScreenComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchCityComponent(),
        const SizedBox(height: 15),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/welcome.png",
                height: 150,
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Text(
                  StringConstants.welcomeText,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: ColorConstants.lightGrey, height: 1.5),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
