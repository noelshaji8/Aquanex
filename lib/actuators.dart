import 'package:flutter/material.dart';

class Actuators extends StatefulWidget {
  const Actuators({super.key});

  @override
  State<Actuators> createState() => _ActuatorsState();
}

class _ActuatorsState extends State<Actuators> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0x665ac18e),
            Color(0x995ac18e),
            Color(0xcc5ac18e),
            Color(0xff5ac18e),
          ],
        ),
      ),
      child: Column(
        children: [
          //addt. info
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text(
              "Actuator Control",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              child: const Row(
                children: [
                  Text(
                    "Last feeding session: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "15 hrs ago",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //2nd info box
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              child: const Row(
                children: [
                  Text(
                    "Last cleansing session: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "15 hrs ago",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 100),
              child: ElevatedButton(
                  onPressed: () {
                    //action
                  },
                  child: Container(
                      width: 150,
                      height: 60,
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Text("Feed"),
                      )))),

                      Padding(
              padding: EdgeInsets.only(top: 25),
              child: ElevatedButton(
                  onPressed: () {
                    //action
                  },
                  child: Container(
                      width: 150,
                      height: 60,
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Text("Cleanse"),
                      ))))
        ],
      ),
    );
  }
}
