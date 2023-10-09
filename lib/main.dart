import 'package:aquanex/actuators.dart';
import 'package:flutter/material.dart';
import 'package:aquanex/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final pageController = PageController(initialPage: 0);

    return MaterialApp(
      title: 'Aquanex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor:Color.fromARGB(255, 210, 202, 175),
        resizeToAvoidBottomInset: true,
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    //Logout function
                  },
                  icon: Icon(Icons.logout))
            ],
            foregroundColor: Colors.black,
            backgroundColor: Color.fromARGB(255, 210, 202, 175),
            shadowColor: null,
            title: const Text("Aquanex"),
            centerTitle: true,
          ),
          body: Column(children: [
            SizedBox(height: 550,child: PageView(
              controller: pageController,
              children: const [
                Home(),
                Actuators(),
                ],
            ),)
              ,
            SmoothPageIndicator(controller: pageController, count: 2,
            effect: SlideEffect(
              
              activeDotColor: Color.fromARGB(255, 112, 112, 112)
            ),),


          ],)
            
          ));
    
  }
}
