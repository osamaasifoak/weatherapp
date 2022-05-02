import 'package:flutter/material.dart';
import 'package:weatherapp/constants/colors/color_constants.dart';

class SelectedWeatherCardComponent extends StatelessWidget {
  const SelectedWeatherCardComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: _size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Showers",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: ColorConstants.black),
            ),
            // Container(
            //   child: ,
            // )
          ],
        ),
      ),
    );
  }
}
