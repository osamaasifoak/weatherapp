import 'package:flutter/material.dart';

class ColorConstants {
  static const Color primary = Color(0xffFF6138);
  static const Color body = Color(0xff101014);
  static const Color black = Color(0xff000000);
  static const Color formFieldBackground = Color(0xffF1F6FC);
  static const Color greyBottomBar = Color(0x84787878);
  static const Color toxicGreen = Color(0xff66db3b);
  static const Color charcoalGrey = Color(0x993c3c43);

  static MaterialColor kPrimaryColor = const MaterialColor(
    0xffFF6138,
    <int, Color>{
      50: primary,
      100: primary,
      200: primary,
      300: primary,
      400: primary,
      500: primary,
      600: primary,
      700: primary,
      800: primary,
      900: primary,
    },
  );
}
