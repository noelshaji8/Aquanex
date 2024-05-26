import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print("Title: ${message.notification?.title}");
  print("Body: ${message.notification?.body}");
  print("Payload: ${message.data}");
}

class FcmNotifications {
  final _fcm = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _fcm.requestPermission();
    final fcmToken = await _fcm.getToken();
    // print("token");
    // print(fcmToken);
    FirebaseMessaging.onBackgroundMessage((handleBackgroundMessage));
  }
}
