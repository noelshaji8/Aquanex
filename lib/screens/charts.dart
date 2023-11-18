import 'package:fl_chart/fl_chart.dart';
import 'package:aquanex/services/api_req.dart';
import 'package:flutter/material.dart';
class Charts extends StatefulWidget {
  const Charts({super.key});

  @override
  State<Charts> createState() => _ChartsState();
}

 
class _ChartsState extends State<Charts> {
 //dynamic chart;
  @override
  void initState() {
    chart();
    
    super.initState();
  }

  chart(){
        final chart = ApiReq().fetchCharts();
        
    }

  
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight,
      color: Color.fromARGB(0, 147, 197, 114),);
      
  }
}