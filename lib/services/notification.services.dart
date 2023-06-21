import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_noti');

  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings();

  const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> showNotifications() async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails('your_channel_Id', 'your_channel_Name');

  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);

  await flutterLocalNotificationsPlugin.show(
      1, "title", "body", notificationDetails);
}
