import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function action;
  final String title;
  BottomButton({this.title, this.action});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: 80.0,
        width: double.infinity,
        color: kBottomColor,
        child: Center(
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}
