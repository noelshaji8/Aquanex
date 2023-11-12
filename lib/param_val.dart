import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParamVal extends StatelessWidget {
  final data;
  
  const ParamVal({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return TextField(
            decoration: InputDecoration(border: InputBorder.none),
            textAlign: TextAlign.center,
            readOnly: true,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            controller: TextEditingController(text: snapshot.data.toString()),
          );
        } else {
          return TextField(
            decoration: InputDecoration(border: InputBorder.none),
            textAlign: TextAlign.center,
            readOnly: true,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            controller: TextEditingController(text: ("...")),
          );
        }
      },
    );
  }
}
