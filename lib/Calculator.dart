import 'dart:math';

class Calculator {
  int height, weight;
  double _bmi;

  Calculator({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi > 25) {
      return 'Please do some more exercise!';
    } else if (_bmi >= 18.5) {
      return 'Hurrah! You are fit!';
    } else {
      return 'Please eat some more!';
    }
  }
}
