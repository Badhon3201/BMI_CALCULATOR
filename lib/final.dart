import 'dart:math';

class CalculateBrain {
  CalculateBrain({this.height, this.weight, this.age});

  final int height;
  final int weight;
  final int age;
  double _bmi;

  String getCalculate(){
    _bmi = weight/pow(height/100, 2);
    //_bmi = weight/(height)*(height)*1000;
    return _bmi.toStringAsFixed(1);

  }
  String getStatus(){
    if(_bmi >= 24.0 && _bmi >29.9){
      return 'মোটা';
    }
    //_bmi > 18.5 && _bmi <= 24.9
    else if(_bmi > 18.5 && _bmi <= 24.9){
      return 'ফিট';
    }
    else{
      return 'চিকন';
    }
  }
  String getMessage(){
    if(_bmi >= 24.0 && _bmi >29.9){
      return 'ডায়েট করুন এবং বেশি বেশি দৌড়ান';
    }
    else if(_bmi > 18.5 && _bmi <= 24.9){
      return 'আপনার ওজন ঠিক আছে ';
    }
    else{
      return 'বেশি বেশি ডিম খান';
    }
  }


}