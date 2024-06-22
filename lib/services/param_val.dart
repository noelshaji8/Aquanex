import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

class ParamVal extends StatelessWidget {
  final data;

  const ParamVal({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            double valdata = double.parse(snapshot.data.toString());
            return AnimatedRadialGauge(
              duration: const Duration(seconds: 1),
              curve: Curves.elasticOut,
              radius: screenWidth * 0.25,
              value: valdata,
              axis: const GaugeAxis(
                min: 0,
                max: 100,
                degrees: 180,
                style: GaugeAxisStyle(
                  thickness: 20,
                  background: Color(0xFFDFE2EC),
                  segmentSpacing: 4,
                ),
                pointer: null,
                progressBar: GaugeProgressBar.rounded(
                  color: Color(0xFFB4C2F8),
                ),
                segments: [
                  GaugeSegment(
                    from: 0,
                    to: 33.3,
                    color: Color(0xFFD9DEEB),
                    cornerRadius: Radius.zero,
                  ),
                  GaugeSegment(
                    from: 33.3,
                    to: 66.6,
                    color: Color(0xFFD9DEEB),
                    cornerRadius: Radius.zero,
                  ),
                  GaugeSegment(
                    from: 66.6,
                    to: 100,
                    color: Color(0xFFD9DEEB),
                    cornerRadius: Radius.zero,
                  ),
                ],
              ),
              builder: (context, child, value) => RadialGaugeLabel(value: 10),
            );
          } else {
            return AnimatedRadialGauge(
              duration: const Duration(seconds: 1),
              curve: Curves.elasticOut,
              radius: screenWidth * 0.25,
              value: 10,
              axis: const GaugeAxis(
                min: 0,
                max: 100,
                degrees: 180,
                style: GaugeAxisStyle(
                  thickness: 20,
                  background: Color(0xFFDFE2EC),
                  segmentSpacing: 4,
                ),
                pointer: null,
                progressBar: GaugeProgressBar.rounded(
                  color: Color(0xFFB4C2F8),
                ),
                segments: [
                  GaugeSegment(
                    from: 0,
                    to: 33.3,
                    color: Color(0xFFD9DEEB),
                    cornerRadius: Radius.zero,
                  ),
                  GaugeSegment(
                    from: 33.3,
                    to: 66.6,
                    color: Color(0xFFD9DEEB),
                    cornerRadius: Radius.zero,
                  ),
                  GaugeSegment(
                    from: 66.6,
                    to: 100,
                    color: Color(0xFFD9DEEB),
                    cornerRadius: Radius.zero,
                  ),
                ],
              ),
            );
          }
        });
  }
}




    // return FutureBuilder(
    //   future: data,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       return RadialGaugeLabel(
    // value: snapshot.data,
    // style: const TextStyle(
    // color: Colors.black,
    // fontSize: 46,
    // fontWeight: FontWeight.bold,
    // ),
    // );

        
    //   },
    // );





    // TextField(
    //         decoration: InputDecoration(border: InputBorder.none),
    //         textAlign: TextAlign.center,
    //         readOnly: true,
    //         style: TextStyle(
    //           fontWeight: FontWeight.bold,
    //           fontSize: 14,
    //         ),
    //         controller: TextEditingController(text: snapshot.data.toString()),
    //       );
    //     } else {
    //       return TextField(
    //         decoration: InputDecoration(border: InputBorder.none),
    //         textAlign: TextAlign.center,
    //         readOnly: true,
    //         style: TextStyle(
    //           fontWeight: FontWeight.bold,
    //           fontSize: 14,
    //         ),
    //         controller: TextEditingController(text: ("-")),
    //       );
    //     }