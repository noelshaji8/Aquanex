import 'package:aquanex/actuators.dart';
import 'package:flutter/material.dart';
import 'package:aquanex/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final pageController = PageController(initialPage: 1);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 56, 193, 125)),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  //Logout function
                },
                icon: Icon(Icons.logout))
          ],
          foregroundColor: Colors.white,
          backgroundColor: Color(0xaab5651d),
          shadowColor: null,
          title: const Text("Aquanex"),
          centerTitle: true,
        ),
        body: PageView(
          controller: pageController,
          children: [
            Home(), 
            Actuators()
            ],
        ),
      ),
    );
  }
}
