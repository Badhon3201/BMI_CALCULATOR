import 'package:flutter/material.dart';
import 'input_page.dart';
import 'reusable_card.dart';


const normalTextStyle = TextStyle(
  fontSize: 20.0, fontWeight: FontWeight.bold,
);
const largeResultText = TextStyle(
  fontSize: 100.0, fontWeight: FontWeight.bold,
);
const yourResult = TextStyle(
  fontSize: 50.0, fontWeight: FontWeight.bold, color: Colors.teal
);
class ResultPage extends StatelessWidget {
  ResultPage({this.calculate, this.status, this.message});
  final String calculate;
  final String status;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                status,
                style: yourResult,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: Color(0xFF1C1B2F),
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    calculate,
                    style: normalTextStyle,
                  ),
                  Text(
                    '18.3',
                    style: largeResultText,
                  ),
                  Text(
                    message,
                    style: normalTextStyle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RECALCULATE',
                  style: CalculateTextStyle,
                ),
              ),
              color: Colors.teal,
              height: 80,
              width: double.infinity,
              padding: EdgeInsets.only(top: 10),
              margin: EdgeInsets.only(bottom: 10),
            ),
          ),
        ],
      ),
    );
  }
}
