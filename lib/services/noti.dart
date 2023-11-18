import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

//FUNCTION FOR NOTIFICATIONS INIT

class Notifications {
  // Notifications({required this.data});

  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings("noti_icon");

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails("channelId", "channelName",
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  Future showNotification(double myDouble,
      {int id = 0, String? title, String? body, String? payload}) async {

       if (myDouble > 30.0 || myDouble < 22.0) {
        return notificationsPlugin.show(
        id, title, body, await notificationDetails());
      }
    
  }
}
