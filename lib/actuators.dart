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
    List<bool> isSelected = [true, false];

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
            padding: EdgeInsets.only(top: 15, bottom: 40),
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
          ToggleButtons(
            constraints: BoxConstraints(minWidth: 90, minHeight: 40),
            children: [Text("AUTO"), Text("MANUAL")], isSelected: isSelected,
            onPressed: (int newIndex) {
              
              setState(() {
                // looping through the list of booleans values
                for (int index = 0; index < isSelected.length; index++) {
                  // checking for the index value
                  if (index == newIndex) {
                    // one button is always set to true
                    isSelected[index] = true;
                  } else {
                    // other two will be set to false and not selected
                    isSelected[index] = false;
                  }
                }
              });
            },
            selectedColor: Colors.white,
            // text color of not selected toggle
            color: Colors.blue,
            // fill color of selected toggle
            fillColor: Colors.lightBlue.shade900,
            // when pressed, splash color is seen
            splashColor: Colors.red,
            // long press to identify highlight color
            highlightColor: Colors.orange,
            // if consistency is needed for all text style
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            // border properties for each toggle
            renderBorder: true,
            borderColor: Colors.black,
            borderWidth: 1.5,
            borderRadius: BorderRadius.circular(10),
            selectedBorderColor: Colors.pink,
          ),
          Padding(
              padding: EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
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
                              value: true,
                              // changes the state of the switch
                              onChanged: (value) => setState(() => value))
                          //
                          ),
                      Transform.scale(
                          scaleX: 1,
                          child: Switch(
                              value: true,
                              // changes the state of the switch
                              onChanged: (value) => setState(() => value))
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
