import 'package:intl/intl.dart';
import '../models/status.dart';

String formatDate(DateTime date) {
  if (date == null) {
    return 'N/A';
  }
  return DateFormat.yMMMMd("en_US").format(date);
}

Status getRoleStatus(DateTime closingDate) {
  if (closingDate == null)
    return Status.CLOSED;
  else if (closingDate.difference(DateTime.now()).inDays < 7)
    return Status.CLOSING_SOON;
  else
    return Status.OPEN;
}
