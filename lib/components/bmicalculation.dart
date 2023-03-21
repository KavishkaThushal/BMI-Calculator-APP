import 'dart:math';

class BmiCalculation {
  BmiCalculation({required this.height, required this.weight});
  final int height;
  final int weight;
  double _bmi = 0;

  String bmiCal() {
    _bmi = weight / (pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getWordResult() {
    if (_bmi >= 30) {
      return 'OBESE WEIGHT';
    } else if (_bmi >= 25 && _bmi < 30) {
      return 'OVER WEIGHT';
    } else if (_bmi > 18.5 && _bmi < 25) {
      return 'NORMAL';
    } else {
      return 'UNDER WEIGHT';
    }
  }

  String getDescription() {
    if (_bmi >= 30) {
      return 'You have a too much body weight than normal body weight.Warning!!';
    }else if (_bmi >= 25 && _bmi < 30) {
      return 'You have a higher than normal body weight.Try to exercise more';
    } else if (_bmi > 18.5 && _bmi < 25) {
      return 'You have a normal body weight.Good job!';
    } else {
      return 'You have a lower than normal body weight.Eat more foods.';
    }
  }

  String getSub() {
    if (_bmi >= 30) {
      return '30-over range kg/m2';

    }else if (_bmi >= 25 && _bmi < 30) {
      return '25-29.5 kg/m2';
    } else if (_bmi > 18.5 && _bmi < 25) {
      return '18.5-24.9 kg/m2';
    } else {
      return '18.5-lower range kg/m2';
    }
  }
}
