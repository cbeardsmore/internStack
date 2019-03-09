import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  if (date == null) {
    return 'Unknown';
  }
  return DateFormat.yMMMMd("en_US").format(date);
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
