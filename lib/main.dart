import 'package:flutter/material.dart';

import 'package:bmi_calculator/screens/input.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(
            0xFF0A0C22,
          ),
          scaffoldBackgroundColor: Color(0xff0A0C22),
          textTheme: TextTheme(
            title: TextStyle(fontFamily: 'Rubik'),
            body1: TextStyle(fontFamily: 'Rubik'),
          )),
      home: InputPage(),
    );
  }
}
