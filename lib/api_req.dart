import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class ApiReq {
  // final headers = {"api_key": "ED1802UZPY1V5E5J", "minutes": 1,"results":1};
  //?api_key=ED1802UZPY1V5E5J&minutes=1&results=1
  Future fetchValues() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.thingspeak.com/channels/2336234/feeds.json?api_key=ED1802UZPY1V5E5J&results=1'),
        // headers: json.encode(headers),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final finalData = data["feeds"][0]["field1"];
        return finalData;
      } else {
        return response.statusCode;
      }
    } catch (e) {
      return e;
    }
  }
  
}

