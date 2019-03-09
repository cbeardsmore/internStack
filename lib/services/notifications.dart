import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:math';

FlutterLocalNotificationsPlugin notifyPlugin;
Random random = new Random(DateTime.now().second);

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
