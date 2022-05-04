import 'package:flutter/material.dart';

class ColorConstants {
  static const Color primary = Color(0xffffffff);
  static const Color body = Color(0xff101014);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color lightGrey = Color.fromARGB(255, 197, 194, 194);
  static const Color grey = Color(0xff1f1f21);
  static const Color charcoalGrey = Color(0x993c3c43);

  static MaterialColor kPrimaryColor = const MaterialColor(
    0xffffffff,
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
