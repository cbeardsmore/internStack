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

arrangeNotification(BuildContext context) async {
  DateTime picked = await datePicker(context);
  DateTime date = new DateTime(picked.year, picked.month, picked.day);
  TimeOfDay time = await timePicker(context);

  date = date.add(Duration(hours: time.hour, minutes: time.minute, seconds: 0));
  scheduleNotification(date);
}
