import 'dart:math';

class ResultsBrain{
  ResultsBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  double _bmi = 0;

  String CalculateBMI(){
    _bmi = weight / pow((height/100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String GetResult(){
    if(_bmi >= 25){
      return 'Overweight';
    }
    else if(_bmi > 18.5){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return 'You have a higher than normal weight. Try to exercise more.';
    }
    else if(_bmi > 18.5){
      return 'You have a normal body weight. Good job!';
    }
    else{
      return 'You have a lower than normal weight. You can eat a bit more.';
    }
  }

}