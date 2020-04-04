import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class GenderReusableCardContent extends StatelessWidget {
  final IconData icon;
  final String text;

  GenderReusableCardContent({this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
