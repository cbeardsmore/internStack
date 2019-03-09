import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dates.dart';

final FlutterLocalNotificationsPlugin notificationsPlugin = new FlutterLocalNotificationsPlugin();

arrangeNotification(BuildContext context, String title, String body) async {
  DateTime picked = await datePicker(context);
  DateTime date = new DateTime(picked.year, picked.month, picked.day);
  TimeOfDay time = await timePicker(context);

  date = date.add(Duration(hours: time.hour, minutes: time.minute, seconds: 0));
  scheduleNotification(date, title, body);
}

void initialiseNotifications() {
  var initializationSettingsAndroid =
      new AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsIOS =
      new IOSInitializationSettings(onDidReceiveLocalNotification: null);
  var initializationSettings = new InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  notificationsPlugin.initialize(initializationSettings,
      onSelectNotification: null);
}

void scheduleNotification(DateTime date, String title, String body) async {
  var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      'your other channel id',
      'your other channel name',
      'your other channel description');
  var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
  NotificationDetails platformChannelSpecifics = new NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  await notificationsPlugin.schedule(0, title, body,
      date, platformChannelSpecifics);
}
