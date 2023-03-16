import 'package:easy_localization/easy_localization.dart';

class TimeUtils {
  static String formatToMyTime(DateTime dateTime) {
    final format = DateFormat.d().format(dateTime);
    return format;
  }

  static String formatToWeek(DateTime dateTime) {
    final format = DateFormat.E().format(dateTime);
    return format;
  }

  static String formatDate(DateTime dateTime) {
    final format = DateFormat.yMMMMd().format(dateTime).toString();
    return format;
  }
}