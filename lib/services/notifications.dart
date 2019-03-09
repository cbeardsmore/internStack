import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin notifyPlugin;

void initialiseNotifications() {
  notifyPlugin = new FlutterLocalNotificationsPlugin();
  var andriodInitSettings = new AndroidInitializationSettings('@mipmap/ic_launcher');
  var iosInitSettings = new IOSInitializationSettings(onDidReceiveLocalNotification: null);
  var initSettings = new InitializationSettings(andriodInitSettings, iosInitSettings);
  notifyPlugin.initialize(initSettings, onSelectNotification: null);
}

void scheduleNotification(DateTime date, String title, String body) async {
  var andriodNotifyDetails = new AndroidNotificationDetails(
      'Closing Application',
      'internStack',
      'Notification of Role closing date');
  var iosNotifyDetails = new IOSNotificationDetails();
  NotificationDetails platformNotifyDetails = new NotificationDetails(andriodNotifyDetails, iosNotifyDetails);
  await notifyPlugin.schedule(0, title, body, date, platformNotifyDetails);
}
