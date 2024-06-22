import 'dart:async';

import 'package:aquanex/services/api_req.dart';
import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

class Actuators extends StatefulWidget {
  const Actuators({super.key});

  @override
  State<Actuators> createState() => _ActuatorsState();
}

class _ActuatorsState extends State<Actuators> {
  List<bool> isToggled = [true, false];
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isAuto = true;
  bool value = false;
  bool isActive = false;

  double tempdata = 0;
  double phdata = 0;
  double temp = 16.5;
  double ph = 2;

  var flag;
  var dialph;

  @override
  void initState() {
    super.initState();
    //ApiReq().actuatorValues(isAuto, 1, value);

    setUpTimedFetch();
  }

//FETCH VALUES AND NOTIFICATION TRIGGER
  setUpTimedFetch() {
    Timer.periodic(Duration(milliseconds: 1000), (timer) async {
      if (mounted) {
        try {
          setState(() {
            ApiReq().fetchValues(1).then((value) {
              tempdata = double.parse(value);
            });

            ApiReq().fetchValues(2).then((value) {
              phdata = double.parse(value);
            });
          });
        } catch (e) {
          print("eee");
        }
        if (tempdata != 0) {
          setState(() {
            temp = tempdata;
          });
        }
        if (phdata != 0) {
          setState(() {
            ph = phdata;
          });
        }
        print(phdata);
        print(tempdata);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),

          //SENSORS

          Container(
            decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(40)),
            // color: Colors.amber,
            height: screenHeight * 0.47,
            width: screenWidth * 0.9,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 20),
                  child: Text(
                    "pH",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                AnimatedRadialGauge(
                  duration: const Duration(seconds: 1),
                  curve: Curves.elasticOut,
                  radius: screenWidth * 0.25,
                  value: 7,
                  axis: const GaugeAxis(
                    min: 1,
                    max: 14,
                    degrees: 180,
                    style: GaugeAxisStyle(
                      thickness: 20,
                      background: Colors.white,
                      segmentSpacing: 4,
                    ),
                    pointer: null,
                    progressBar: GaugeProgressBar.rounded(
                      color: Color.fromARGB(255, 150, 63, 63),
                      //Color.fromARGB(255, 49, 52, 86)
                    ),
                  ),
                  //child: const RadialGaugeLabel(value: 7,style: TextStyle(color: Colors.white),),
                  builder: (context, child, value) {
                    //return const RadialGaugeLabel(value: 7);
                    if (phdata != 0) {
                      return RadialGaugeLabel(
                        value: phdata,
                        style: TextStyle(color: Colors.white),
                      );
                    } else if (ph == 2 && phdata == 0) {
                      return SizedBox();
                    } else {
                      return RadialGaugeLabel(
                        value: ph,
                        style: TextStyle(color: Colors.white),
                      );
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 20),
                  child: Text(
                    "Temperature",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                AnimatedRadialGauge(
                  duration: const Duration(seconds: 1),
                  curve: Curves.elasticOut,
                  radius: screenWidth * 0.25,
                  value: tempdata <= 16.5 ? temp : tempdata,
                  axis: const GaugeAxis(
                    min: 15,
                    max: 35,
                    degrees: 180,
                    style: GaugeAxisStyle(
                      thickness: 20,
                      background: Colors.white,
                      segmentSpacing: 4,
                    ),
                    pointer: null,
                    progressBar: GaugeProgressBar.rounded(
                      color: Color.fromARGB(255, 150, 63, 63),
                    ),
                  ),
                  builder: (context, child, value) {
                    if (tempdata != 0) {
                      return RadialGaugeLabel(
                        value: tempdata,
                        style: TextStyle(color: Colors.white),
                      );
                    } else if (temp == 16.5 && tempdata == 0) {
                      return SizedBox();
                    } else {
                      return RadialGaugeLabel(
                        value: temp,
                        style: TextStyle(color: Colors.white),
                      );
                      
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(40)),
              // color: Colors.amber,
              height: screenHeight * 0.29,
              width: screenWidth * 0.9,
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Column(children: [
                  //MODE BUTTON

                  ToggleButtons(
                    constraints: BoxConstraints(minWidth: 90, minHeight: 40),

                    onPressed: (int newindex) {
                      setState(() {
                        for (int index = 0; index < isToggled.length; index++) {
                          if (index == newindex) {
                            isToggled[index] = true;
                          } else {
                            isToggled[index] = false;
                          }
                        }
                        if (newindex == 1) {
                          isAuto = false;
                        } else {
                          isAuto = true;
                          isSwitched1 = false;
                          isSwitched2 = false;
                        }
                        ApiReq().actuatorValues(isAuto, 1, isSwitched1);
                      });
                      //ApiReq().actuatorValues(isAuto, 1, false);
                    },
                    isSelected: isToggled,
                    children: [Text("AUTO"), Text("MANUAL")],

                    selectedColor: Colors.black,
                    // text color of not selected toggle
                    color: Colors.white38,
                    // fill color of selected toggle
                    fillColor: Color.fromARGB(255, 150, 63, 63),
                    // when pressed, splash color is seen
                    splashColor: Color.fromARGB(255, 150, 63, 63),
                    // long press to identify highlight color
                    highlightColor: Color.fromARGB(255, 150, 63, 63),
                    // if consistency is needed for all text style
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    // border properties for each toggle
                    renderBorder: true,
                    borderColor: Colors.black,
                    borderWidth: 1,
                    borderRadius: BorderRadius.circular(30),
                    selectedBorderColor: Colors.black,
                  ),

                  //CONTROL BUTTONS

                  Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (!isAuto) {
                                    if (isSwitched1 == false) {
                                      setState(() {
                                        isSwitched1 = true;
                                        isSwitched2 = false;
                                      });
                                    } else if (isSwitched1 == true) {
                                      setState(() {
                                        isSwitched1 = false;
                                      });
                                    }
                                    ApiReq()
                                        .actuatorValues(isAuto, 1, isSwitched1);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                      color: isSwitched1
                                          ? Color.fromARGB(255, 49, 52, 86)
                                          : const Color.fromARGB(
                                              255, 150, 63, 63),
                                      borderRadius: BorderRadius.circular(18),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 5,
                                            offset: Offset(0, 2))
                                      ]),
                                  child: Icon(Icons.water_drop_outlined),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Text(
                                  "Motor",
                                  style: TextStyle(
                                    fontWeight: isSwitched1
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: isSwitched1
                                        ? Colors.white
                                        : Colors.white60,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (!isAuto) {
                                    if (isSwitched2 == false) {
                                      setState(() {
                                        isSwitched2 = true;
                                        isSwitched1 = false;
                                      });
                                    } else if (isSwitched2 == true) {
                                      setState(() {
                                        isSwitched2 = false;
                                      });
                                    }
                                    ApiReq()
                                        .actuatorValues(isAuto, 2, isSwitched2);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                      color: isSwitched2
                                          ? Color.fromARGB(255, 49, 52, 86)
                                          : const Color.fromARGB(
                                              255, 150, 63, 63),
                                      borderRadius: BorderRadius.circular(18),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 5,
                                            offset: Offset(0, 2))
                                      ]),
                                  child: Icon(Icons.restaurant_rounded),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Text(
                                  "Feeder",
                                  style: TextStyle(
                                    fontWeight: isSwitched2
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: isSwitched2
                                        ? Colors.white
                                        : Colors.white60,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ))
                ]),
              )),
        ],
      ),
    );
  }
}
