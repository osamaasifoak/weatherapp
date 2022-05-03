import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static getOrientation(BuildContext context) =>
      MediaQuery.of(context).orientation;

  static String getWeekDay(String date) {
    var parsedDate = DateTime.parse(date);
    return DateFormat('EEEE').format(parsedDate);
  }
}
