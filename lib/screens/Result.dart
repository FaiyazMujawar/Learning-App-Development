import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/components/Card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Your Result',
            style: kResultTitleStyle,
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: ReusableCard(color: kActiveCardColor),
            ),
          ),
          Expanded(
            child: BottomButton(
              title: 'RE-CALCULATE',
              action: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
