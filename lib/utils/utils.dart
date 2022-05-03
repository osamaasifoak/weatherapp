import 'package:intl/intl.dart';

class Utils {
  static String getWeekDay(String date) {
    var parsedDate = DateTime.parse(date);
    return DateFormat('EEEE').format(parsedDate);
  }
}
