import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/constants/colors/color_constants.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
      primaryColor: ColorConstants.primary,
      primarySwatch: ColorConstants.kPrimaryColor,
      scaffoldBackgroundColor: ColorConstants.body,
      textTheme: GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme)
          .apply(bodyColor: Colors.white),
      inputDecorationTheme: _inputDecorationTheme());
}

InputDecorationTheme _inputDecorationTheme() {
  return InputDecorationTheme(
      labelStyle: GoogleFonts.raleway(
        fontSize: 17.0,
        fontStyle: FontStyle.normal,
        color: ColorConstants.lightGrey,
      ),
      hintStyle: GoogleFonts.raleway(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.8,
        color: ColorConstants.lightGrey,
      ),
      border: InputBorder.none,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(color: ColorConstants.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(color: ColorConstants.grey),
      ),
      fillColor: ColorConstants.grey);
}
