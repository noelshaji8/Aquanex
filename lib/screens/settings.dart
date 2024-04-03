import 'package:aquanex/services/api_req.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

int? runMotor;
int? runFeeder;
int? intervalMotor;
int? intervalFeeder;

double? phMin;
double? phMax = 8.55;
double? tempMin;
double? tempMax;

bool isEdit = false;

class _SettingsState extends State<Settings> {
  TextEditingController tecRunmotor = TextEditingController();
  TextEditingController tecRunfeeder = TextEditingController();
  TextEditingController tecIntmotor = TextEditingController();
  TextEditingController tecIntfeeder = TextEditingController();

  TextEditingController tecPhmin = TextEditingController();
  TextEditingController tecPhmax = TextEditingController();
  TextEditingController tecTempmin = TextEditingController();
  TextEditingController tecTempmax = TextEditingController();

  @override
  void initState() {
    super.initState();

    ApiReq().getSettingsValues().then((value) {
      print(value);

      settingsFetch(value);
    });
  }

  settingsFetch(var value) {
    runMotor = value["motorRunTime"];
    runFeeder = value["feederRunTime"];
    intervalMotor = value["motorInterval"];
    intervalFeeder = value["feederInterval"];
    phMin = value["phMin"];
    phMax = value["phMax"];
    tempMin = value["tempMin"];
    tempMax = value["tempMax"];

    tecRunmotor.text = runMotor.toString();
    tecRunfeeder.text = runFeeder.toString();
    tecIntmotor.text = intervalMotor.toString();
    tecIntfeeder.text = intervalFeeder.toString();
    tecPhmin.text = phMin.toString();
    tecPhmax.text = phMax.toString();
    tecTempmin.text = tempMin.toString();
    tecTempmax.text = tempMax.toString();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
        //physics: NeverScrollableScrollPhysics(),
        child: Container(
      alignment: Alignment.center,
      color: Colors.black,
      height: screenHeight * 0.812,
      width: screenWidth,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(15),
              height: screenHeight * 0.075,
              width: screenWidth * 0.85,
              decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(18)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 3,
                      child: Text(
                        "Motor Runtime",
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                          height: 30,
                          width: 60,
                          child: Container(
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                              enabled: isEdit,
                              onChanged: (value) {
                                setState(() {
                                  runMotor = double.parse(value).toInt();
                                });
                              },
                              controller: tecRunmotor,
                            ),
                          )))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(15),
              height: screenHeight * 0.075,
              width: screenWidth * 0.85,
              decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(18)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 3,
                      child: Text(
                        "Feeder Runtime",
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                          height: 30,
                          width: 60,
                          child: Container(
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                              enabled: isEdit,
                              onChanged: (value) {
                                setState(() {
                                  runFeeder = double.parse(value).toInt();
                                });
                              },
                              controller: tecRunfeeder,
                            ),
                          )))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(15),
              height: screenHeight * 0.075,
              width: screenWidth * 0.85,
              decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(18)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 3,
                      child: Text(
                        "Motor Interval",
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                          height: 30,
                          width: 60,
                          child: Container(
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                              enabled: isEdit,
                              onChanged: (value) {
                                setState(() {
                                  intervalMotor = double.parse(value).toInt();
                                });
                              },
                              controller: tecIntmotor,
                            ),
                          )))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(15),
              height: screenHeight * 0.075,
              width: screenWidth * 0.85,
              decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(18)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 3,
                      child: Text(
                        "Feeder Interval",
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 30,
                      width: 60,
                      child: Container(
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                          enabled: isEdit,
                          onChanged: (value) {
                            setState(() {
                              
                              intervalFeeder = double.parse(value).toInt() ;
                            });
                          },
                          controller: tecIntfeeder,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(15),
              height: screenHeight * 0.075,
              width: screenWidth * 0.85,
              decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(18)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 4,
                      child: Text(
                        "pH thresholds",
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                          height: 30,
                          width: 50,
                          child: Container(
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                              enabled: isEdit,
                              onChanged: (value) {
                                setState(() {
                                  phMin = double.parse(value);
                                });
                              },
                              controller: tecPhmin,
                            ),
                          ))),
                  SizedBox(
                    child: Text(
                      "-",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                          height: 30,
                          width: 50,
                          child: Container(
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                              enabled: isEdit,
                              onChanged: (value) {
                                setState(() {
                                  phMax = double.parse(value);
                                });
                              },
                              controller: tecPhmax,
                            ),
                          )))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(15),
              height: screenHeight * 0.075,
              width: screenWidth * 0.85,
              decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(18)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 4,
                      child: Text(
                        "Temperature thresholds",
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                          height: 30,
                          width: 50,
                          child: Container(
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                              enabled: isEdit,
                              onChanged: (value) {
                                setState(() {
                                  tempMin = double.parse(value);
                                });
                              },
                              controller: tecTempmin,
                            ),
                          ))),
                  SizedBox(
                    child: Text(
                      "-",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                          height: 30,
                          width: 50,
                          child: Container(
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                              enabled: isEdit,
                              onChanged: (value) {
                                setState(() {
                                  tempMax = double.parse(value);
                                });
                              },
                              controller: tecTempmax,
                            ),
                          )))
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(isEdit == true
                    ? Color.fromARGB(255, 49, 52, 86)
                    : const Color.fromARGB(255, 150, 63, 63))),
            onPressed: () {
              if (!isEdit) {
                setState(() {
                  isEdit = true;
                });
              } else {
                setState(() {
                  isEdit = false;

                  ApiReq().postSettingsValues(
                      runMotor,
                      runFeeder,
                      intervalMotor,
                      intervalFeeder,
                      phMin,
                      phMax,
                      tempMin,
                      tempMax);

                  ApiReq().getSettingsValues().then((value) {
                    setState(() {
                      settingsFetch(value);
                    });
                  });
                  //settingsFetch();
                });
              }
            },
            child: isEdit
                ? Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )
                : Text(
                    "Edit",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
            //style: ButtonStyle(),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () => {
                ApiReq().settingsValuesDefault().then((value) {
                  setState(() {
                    settingsFetch(value);
                  });
                })
              },
              child: Text(
                "Reset to Defaults",
                style: TextStyle(
                    color: Color.fromARGB(225, 255, 255, 255),
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
