import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.weight, this.height});

  final int weight;
  final int height;

//  Underscore makes this private
  double _BMI;

  String calculateBMI() {
    _BMI = weight / pow(height / 100, 2);
//    To String As Fix converts double to a string and determines the # of decimals
    print("BMI: " + _BMI.toString());
    print("Weight: " + weight.toString());
    print("Height: " + height.toString());
    return _BMI.toStringAsFixed(1);
  }

  String getResults() {
    if (_BMI >= 25) {
      return 'overweight';
    } else if (_BMI > 18.5) {
      return 'Normal';
    } else {
      return 'underweight';
    }
  }

  String getInterpretation() {
    if (_BMI >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more';
    } else if (_BMI > 18.5) {
      return 'You have a normal body weight. Good Job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }
}
