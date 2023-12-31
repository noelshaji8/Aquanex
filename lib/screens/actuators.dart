import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight,
      color: Colors.white,
      child: Column(
        children: [
          //addt. info
          const Padding(
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
                color: Color(0xbb93C572),
                border: Border.all(color: Color(0xbb93C572)),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              child: const Row(
                children: [
                  Text(
                    "Last feeding session:   ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "15 hrs",
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
            padding: EdgeInsets.only(top: 15, bottom: 40),
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xbb93C572),
                border: Border.all(color: Color(0xbb93C572)),
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
                    "15 hrs",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                }
                else{
                  isAuto = true;
                  isSwitched1=false;
                  isSwitched2=false;
                }
              });
            },
            isSelected: isToggled,
            children: [Text("AUTO"), Text("MANUAL")],

            selectedColor: Colors.white,
            // text color of not selected toggle
            color: Colors.black,
            // fill color of selected toggle
            fillColor: Color(0xbb93C572),
            // when pressed, splash color is seen
            splashColor: Color(0xbb93C572),
            // long press to identify highlight color
            highlightColor: Color(0xbb93C572),
            // if consistency is needed for all text style
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            // border properties for each toggle
            renderBorder: true,
            borderColor: Colors.black,
            borderWidth: 1,
            borderRadius: BorderRadius.circular(10),
            selectedBorderColor: Colors.black,
          ),
          Padding(
              padding: EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cleanse",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Feed",
                          style: TextStyle(fontSize: 20),
                        ),
                      ]),
                  SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      Transform.scale(
                        scaleX: 1,
                        child: Switch(
                          inactiveTrackColor: Colors.white,
                            activeColor: Color(0xbb93C572),
                            value: isSwitched1,
                            // changes the state of the switch
                            onChanged: isAuto? null: (value) {
                                    setState(() {
                                      isSwitched1 = value;
                                    });
                                  }
                            //
                            ),
                      ),
                      Transform.scale(
                          scaleX: 1,
                          child: Switch(
                            inactiveTrackColor: Colors.white,
                              activeColor: Color(0xbb93C572),
                              value: isSwitched2,
                              // changes the state of the switch
                              onChanged: isAuto? null: (value) {
                                      setState(() {
                                        isSwitched2 = value;
                                      });
                                    }
                              //
                              )
                          //
                          ),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
