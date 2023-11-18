// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Initialize the local notifications plugin
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   // Configure the plugin
//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');
//   final InitializationSettings initializationSettings =
//       InitializationSettings(
//     android: initializationSettingsAndroid,
//   );

//   // Initialize the plugin
//   await flutterLocalNotificationsPlugin.initialize(
//     initializationSettings,
//     onSelectNotification: (String? payload) async {
//       if (payload != null) {
//         debugPrint('Notification payload: $payload');
//       }
//     },
//   );

 
// }

// Future<void> checkAndShowNotification() async {
//   final double threshold = 10.0; // Set your threshold value
//   final double obtainedValue = await fetchData();

//   if (obtainedValue > threshold) {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your_channel_id',
//       'your_channel_name',
//       'your_channel_description',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);

//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'Notification Title',
//       'Notification Body',
//       platformChannelSpecifics,
//       payload: 'Custom_Sound',
//     );
//   }
// }
