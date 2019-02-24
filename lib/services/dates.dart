import 'package:intl/intl.dart';
import '../models/status.dart';

String formatDate(DateTime date) {
  if (date == null) {
    return 'N/A';
  }
  return DateFormat.yMMMMd("en_US").format(date);
}

String getRoleStatusString(DateTime closingDate) {
  Status status = Status.OPEN;
  if (closingDate == null)
    status = Status.CLOSED;
  else if (closingDate.difference(DateTime.now()).inDays < 7)
    status = Status.CLOSING_SOON;

  return status.toString().split('.').last.replaceAll('_', ' ');
}
