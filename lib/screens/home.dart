import 'package:aquanex/screens/actuators.dart';
import 'package:aquanex/screens/graphs.dart';
import 'package:aquanex/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Future? data;

  var selectedIndex = 1;
  static const List<Widget> widgetOptions = <Widget>[
    Settings(),
    Actuators(),
    Graphs(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    //WHOLE THING

    return Scaffold(
      //backgroundColor: Colors.black87,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              if(selectedIndex==1){
               SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              }
              else{
                setState(() {
                  selectedIndex = 1;
                });
              }
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        shadowColor: null,
        title: const Text("Aquanex"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.grey[700],
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart_outlined_sharp),
              label: 'Analysis',
              backgroundColor: Colors.black,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.white,
          iconSize: 20,
          onTap: onItemTapped,
          elevation: 5),

      body: widgetOptions.elementAt(selectedIndex),
    );
  }
}
