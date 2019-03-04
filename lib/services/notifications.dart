import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin notificationsPlugin;

void initialiseNotifications() {
  notificationsPlugin = new FlutterLocalNotificationsPlugin();
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
