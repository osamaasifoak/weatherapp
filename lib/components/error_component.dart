import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/constants/colors/color_constants.dart';
import 'package:weatherapp/constants/strings/asset_constants.dart';
import 'package:weatherapp/views/weather/components/search_component.dart';

class ErrorComponent extends StatelessWidget {
  const ErrorComponent({
    Key? key,
    required this.onTap,
    required this.message,
  }) : super(key: key);
  final void Function() onTap;
  final String message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const SearchCityComponent(),
          const SizedBox(height: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetConstants.welcome,
                  height: 150,
                ),
                const SizedBox(height: 15),
                _richText(
                  context,
                  message,
                  " Retry",
                  onTap: onTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  RichText _richText(BuildContext context, String title, String text,
      {void Function()? onTap}) {
    return RichText(
      text: TextSpan(
        text: title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ColorConstants.charcoalGrey,
            ),
        children: <TextSpan>[
          TextSpan(
              text: text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ColorConstants.primary,
                  ),
              recognizer: TapGestureRecognizer()..onTap = onTap)
        ],
      ),
    );
  }
}
