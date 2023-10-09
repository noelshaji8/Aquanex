import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
        width: screenWidth,
        height: screenHeight,
        color: Color.fromARGB(255, 210, 202, 175),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text(
                "Parameters",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            //Water params
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25, top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        //first box
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Container(
                            width: 150,
                            height: 80,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: const Column(
                              children: [
                                Text(
                                  "NH3",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "0.2",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        //second box
                        Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: Container(
                            width: 150,
                            height: 80,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: const Column(
                              children: [
                                Text(
                                  "pH",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "7.5",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      //third box
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Container(
                          width: 150,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Column(
                            children: [
                              Text(
                                "Temp",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "23",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //fourth box
                      Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Container(
                          width: 150,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Column(
                            children: [
                              Text(
                                "DO",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "5",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            //static info

            const Padding(
              padding: EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  Text(
                    "Optimum Values",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("pH: 6.2 - 7.5"),
                  Text("DO: 4 - 5 ppm"),
                  Text("temp: 22 - 27"),
                  Text("NH3: 0.0 - 0.5 ppm"),
                ],
              ),
            ),
          ],
        ));
  }
}
