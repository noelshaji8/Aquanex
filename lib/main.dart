// import 'dart:io';

import 'package:aquanex/screens/actuators.dart';
import 'package:aquanex/screens/graphs.dart';
import 'package:aquanex/services/fcmnoti.dart';
import 'package:flutter/material.dart';
import 'package:aquanex/screens/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAp7EH7nojC6t4KuoaVf4PWu31HrEkxnU0",
          appId: '1:701604000334:android:45955661a2b8b6bee1491f',
          messagingSenderId: '701604000334',
          projectId: 'aquanex-cbd72'));
  await FcmNotifications().initNotifications();

  runApp(MaterialApp(
      title: 'Aquanex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Home();
  }
}
