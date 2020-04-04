import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/components/Card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String result, interpretation, bmi;

  const ResultPage({Key key, this.bmi, this.result, this.interpretation})
      : super(key: key);
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Your Result',
                style: kResultTitleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: ReusableCard(
                color: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      result,
                      style: kResultStyle,
                    ),
                    Text(
                      bmi,
                      style: kBmiStyle,
                    ),
                    Text(
                      interpretation,
                      style: kInterpretationStyle,
                    ),
                  ],
                ),
              ),
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
