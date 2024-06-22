import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class ApiReq {
  Future fetchValues(int flag) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.thingspeak.com/channels/2336234/feeds.json?api_key=ED1802UZPY1V5E5J&results=1'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final tempData = data["feeds"][0]["field1"];
        final phData = data["feeds"][0]["field2"];

        if (flag == 1) {
          return tempData;
        } else if (flag == 2) {
          return phData;
        }
      } else {
        return response.statusCode;
      }
    } catch (e) {
      print(e);
    }
  }

  Future actuatorValues(bool modeflag, int act, bool acflag) async {
    Map<dynamic, dynamic> body = {
      "automode": modeflag,
      "actuator": act,
      "value": acflag
    };
    //print(body);

    try {
      await http.post(
        Uri.parse("https://aquanex-backend.onrender.com/send-acvalue"),
        body: json.encode(body),
        headers: {'Content-Type': 'application/json'},
      );
    } catch (e) {
      return e;
    }
  }

  Future postSettingsValues(
      int? runMotor,
      int? runFeeder,
      int? intervalMotor,
      int? intervalFeeder,
      double? phMin,
      double? phMax,
      double? tempMin,
      double? tempMax) async {
    Map<dynamic, dynamic> body = {
      "motorRunTime": runMotor,
      "feederRunTime": runFeeder,
      "motorInterval": intervalMotor,
      "feederInterval": intervalFeeder,
      "phMin": phMin,
      "phMax": phMax,
      "tempMin": tempMin,
      "tempMax": tempMax
    };
    //print(body);

    try {
      await http.post(
        Uri.parse("https://aquanex-backend.onrender.com/settings"),
        body: json.encode(body),
        headers: {'Content-Type': 'application/json'},
      );
    } catch (e) {
      return e;
    }
  }

  Future settingsValuesDefault() async {
    // Map<dynamic, dynamic> body = { "motorRunTime": runMotor, "feederRunTime": runFeeder, "motorInterval": intervalMotor, "feederInterval": intervalFeeder};
    // //print(body);

    try {
      final response = await http.get(
        Uri.parse("https://aquanex-backend.onrender.com/settings-default"),
        //body: json.encode(body),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        return data;
      } else {
        return response.statusCode;
      }
    } catch (e) {
      return e;
    }
  }

  Future getSettingsValues() async {
    // Map<dynamic, dynamic> body = { "motorRunTime": runMotor, "feederRunTime": runFeeder, "motorInterval": intervalMotor, "feederInterval": intervalFeeder};
    // //print(body);

    try {
      final response = await http.get(
        Uri.parse("https://aquanex-backend.onrender.com/settings-read"),
        //body: json.encode(body),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        return data;
      } else {
        return response.statusCode;
      }
    } catch (e) {
      return e;
    }
  }
}
