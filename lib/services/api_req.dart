
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class ApiReq {
  
  Future fetchValues() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.thingspeak.com/channels/2336234/feeds.json?api_key=ED1802UZPY1V5E5J&results=1'),
        
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
   
  Future fetchCharts() async{
    try{
      final response = await http.get(
        Uri.parse('https://thingspeak.com/channels/2336234/charts/1?api_key=ED1802UZPY1V5E5J&bgcolor=%23ffffff&color=%23d62020&dynamic=true&results=60&type=line&update=5'));

        if (response.statusCode == 200) {
        final chart = json.decode(response.body);
        print(chart);
        return chart;
      } else {
        return response.statusCode;
      }
    } catch (e) {
      return e;
    }
    }
  }
  


