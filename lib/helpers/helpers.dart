import 'package:intl/intl.dart';
// 'Thursday, Feb 2,2023',

formateDateTime(DateTime dateTime) {
  DateFormat format = DateFormat('${DateFormat.WEEKDAY} ${DateFormat.ABBR_MONTH} ${DateFormat.DAY}, ${DateFormat.YEAR}');
  return format.format(dateTime);
}

// 2023-2-3 to 2023-2-2
formateDate(DateTime dateTime) {
  DateFormat format = DateFormat('${DateFormat.YEAR}-${DateFormat.NUM_MONTH}-${DateFormat.DAY}');
  return format.format(dateTime);
}

formateDateForAPI(DateTime dateTime) {
  DateFormat format = DateFormat('${DateFormat.YEAR}-${DateFormat.NUM_MONTH}-${DateFormat.DAY}');
  return format.format(dateTime);
}

formateTime(DateTime dateTime) {
  DateFormat format = DateFormat('${DateFormat.HOUR_MINUTE_SECOND}');
  return format.format(dateTime);
}
