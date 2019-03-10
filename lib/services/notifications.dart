import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:math';
import 'dates.dart';

FlutterLocalNotificationsPlugin notifyPlugin;
Random random = new Random(DateTime.now().second);

arrangeNotification(BuildContext context, String title, String body) async {
  DateTime picked = await datePicker(context);
  DateTime date = new DateTime(picked.year, picked.month, picked.day);
  TimeOfDay time = await timePicker(context);

  date = date.add(Duration(hours: time.hour, minutes: time.minute, seconds: 0));
  scheduleNotification(date, title, body);
}

void initialiseNotifications() {
  notifyPlugin = new FlutterLocalNotificationsPlugin();
  var andriodInitSettings = new AndroidInitializationSettings('app_icon');
  var iosInitSettings = new IOSInitializationSettings(onDidReceiveLocalNotification: null);
  var initSettings = new InitializationSettings(andriodInitSettings, iosInitSettings);
  notifyPlugin.initialize(initSettings, onSelectNotification: null);
}

void scheduleNotification(DateTime date, String title, String body) async {
  var andriodNotifyDetails = new AndroidNotificationDetails(
      'Closing Application',
      'internStack',
      'Notification of Role closing date',
);
  var iosNotifyDetails = new IOSNotificationDetails();
  NotificationDetails platformNotifyDetails = new NotificationDetails(andriodNotifyDetails, iosNotifyDetails);
  await notifyPlugin.schedule(random.nextInt(1000), title, body, date, platformNotifyDetails);
}
