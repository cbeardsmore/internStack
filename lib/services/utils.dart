import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'notifications.dart';
import 'dates.dart';

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

shareURL(String url) async {
  Share.share('Found by internStack: ' + url);
}

arrangeNotification(BuildContext context, String title, String body) async {
  DateTime date = await datePicker(context);
  if (date == null) return;
  TimeOfDay time = await timePicker(context);
  if (time == null) return;

  date = new DateTime(date.year, date.month, date.day);
  date = date.add(Duration(hours: time.hour, minutes: time.minute, seconds: 0));
  scheduleNotification(date, title, body);
}
