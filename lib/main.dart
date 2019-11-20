import 'package:flutter/material.dart';
import 'input_page.dart';


void main(){
  runApp(BMI());
}

class BMI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0C0F1E),
        scaffoldBackgroundColor: Color(0xFF0C0F1E),
      ),
      home: inputPage(),
    );
  }
}
