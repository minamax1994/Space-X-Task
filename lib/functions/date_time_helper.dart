import 'package:intl/intl.dart';

class DateTimeHelper {
  static final standardDateTimeFormat = "EEE, d MMM yyyy hh:mm a";
  static final standardDateFormat = "EEE, d MMM yyyy";

  static String format(DateTime dateTime, [String format]) {
    if (format != null) {
      return DateFormat(format, 'en_US').format(dateTime.toLocal());
    }
    return DateFormat(standardDateTimeFormat, 'en_US').format(dateTime.toLocal());
  }

  static String getStringSelectedSpan(DateTime from, DateTime to) {
    return "From:  " +
        format(from.toLocal(), standardDateFormat) +
        "\n" +
        "To:       " +
        format(to.toLocal(), standardDateFormat);
  }

  static normalizeToDays(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }
}
