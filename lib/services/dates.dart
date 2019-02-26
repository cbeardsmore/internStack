import 'package:flutter/material.dart';
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

Future<DateTime> datePicker(BuildContext context) async {
  DateTime staticNow = DateTime.now();
  int currentYear = DateTime.now().year;

  final DateTime picked = await showDatePicker(
      context: context,
      initialDate: staticNow,
      firstDate: staticNow,
      lastDate: DateTime(currentYear + 1));

  return picked;
}

Future<TimeOfDay> timePicker(BuildContext context) async {

  final TimeOfDay time =
      await showTimePicker(context: context, initialTime: TimeOfDay.now());

  return time;
}
