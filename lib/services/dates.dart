import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  if (date == null) {
    return 'Unknown';
  }
  return DateFormat.yMMMMd("en_US").format(date);
}
