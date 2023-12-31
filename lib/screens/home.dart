import 'dart:async';
import 'package:aquanex/services/noti.dart';
import 'package:flutter/material.dart';
import 'package:aquanex/services/param_val.dart';
import 'package:aquanex/services/api_req.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future? data;

  var myDouble;

  @override
  void initState() {
    super.initState();

    setUpTimedFetch();
  }

  setUpTimedFetch() {
    Timer.periodic(Duration(milliseconds: 5000), (timer) async {
      setState(() {
        data = ApiReq().fetchValues();

        ApiReq().fetchValues().then((value) async {
          print("value: $value");
          print(value.runtimeType);

          myDouble = double.tryParse(await value);
        });

        print("data: $data");
      });
      try {
        Notifications().showNotification(await myDouble,
            title: "Temperature", body: "Threshold crossed");
      } catch (e) {
        print(e);
      }
    });
  }

  // notiTrigger(data)  {
  //   try {
  //     double doubleData = double.tryParse(data) ?? 0;
  //     print("double: $doubleData");
  //     if (doubleData > 28 || doubleData < 22) {
  //       Notifications()
  //           .showNotification(title: "Temperature", body: "Threshold crossed");
  //     }
  //   } catch (e) {
  //     print("error is: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
        width: screenWidth,
        height: screenHeight,
        color: Color.fromARGB(0, 147, 197, 114),
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
                              color: Color(0xbb93C572),
                              border: Border.all(color: Color(0xbb93C572)),
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
                              color: Color(0xbb93C572),
                              border: Border.all(color: Color(0xbb93C572)),
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
                            color: Color(0xbb93C572),
                            border: Border.all(color: Color(0xbb93C572)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.only(top: 7),
                          child: Column(
                            children: [
                              SizedBox(
                                  child: Text(
                                "Temp",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              )),
                              SizedBox(
                                child: ParamVal(
                                  data: data,
                                ),
                              )
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
                            color: Color(0xbb93C572),
                            border: Border.all(color: Color(0xbb93C572)),
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
              child: Column(children: [
                Text(
                  "Optimum Values",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "pH:",
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                "DO:",
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                "Temp:",
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                "NH3:",
                                style: TextStyle(fontSize: 14),
                              ),
                            ]),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "6.2 - 7.5",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    "4.0 - 5.0 ppm",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    "22 - 27 °C",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    "0.0 - 0.5 ppm",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ])
                          ],
                        )
                      ],
                    )),
              ]),
            ),
          ],
        ));
  }
}
