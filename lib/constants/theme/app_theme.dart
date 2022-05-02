
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/constants/colors/color_constants.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
      primaryColor: ColorConstants.primary,
      primarySwatch: ColorConstants.kPrimaryColor,
      scaffoldBackgroundColor: ColorConstants.body,
      
      textTheme:GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
      inputDecorationTheme: _inputDecorationTheme());
}

InputDecorationTheme _inputDecorationTheme() {
  return InputDecorationTheme(
      labelStyle: GoogleFonts.raleway(
        fontSize: 17.0,
        fontStyle: FontStyle.normal,
        color: ColorConstants.charcoalGrey,
      ),
      border: InputBorder.none,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(color: ColorConstants.formFieldBackground),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(color: ColorConstants.formFieldBackground),
      ),
      fillColor: ColorConstants.formFieldBackground);
}

