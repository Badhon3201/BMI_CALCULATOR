import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_contant.dart';
import 'reusable_card.dart';
import 'result_page.dart';
import 'final.dart';

const activeCardColor = Colors.teal;
const inactiveCardColor = Color(0xFF121224);
const LabelTextStyle = TextStyle(
  fontSize: 45.0, fontWeight: FontWeight.w900,
);
const CalculateTextStyle = TextStyle(
  fontSize: 25.0, fontWeight: FontWeight.bold,
);



class inputPage extends StatefulWidget {
  @override
  _inputPageState createState() => _inputPageState();
}

class _inputPageState extends State<inputPage> {
  int height = 180;
  int weight = 50;
  int age = 25;
  Color maleCardColor = activeCardColor;
  Color femaleCardColor = inactiveCardColor;
  void updateColor(int gender){
    if(gender==1){
      if(maleCardColor==inactiveCardColor){
        maleCardColor=activeCardColor;
        femaleCardColor=inactiveCardColor;
      }else{
        maleCardColor=inactiveCardColor;
      }
    }
    if(gender==2){
      if(femaleCardColor==inactiveCardColor){
        femaleCardColor=activeCardColor;
        maleCardColor=inactiveCardColor;
      }else{
        femaleCardColor=inactiveCardColor;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: ReusableCard(
                      colour: maleCardColor,
                      childCard: iconContant(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColor(2);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColor,
                      childCard: iconContant(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1C1B2F),
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: LabelTextStyle,
                            ),
                            Text(
                              'CM'
                            ),
                          ],
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          activeColor: Colors.green,
                          inactiveColor: Colors.red,
                          onChanged: (double newValue){
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1C1B2F),
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: LabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1C1B2F),
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 15.0
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: LabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              CalculateBrain Cal = CalculateBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                calculate: Cal.getCalculate(),
                status: Cal.getStatus(),
                message: Cal.getMessage(),
              )));
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: CalculateTextStyle,
                ),
              ),
              color: Colors.teal,
              height: 60.0,
              width: double.infinity,
              padding: EdgeInsets.only(top: 10),
            ),
          ),
        ],
      ),
    );
  }
}
class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, this.onPress});
  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        height: 55.0,
        width: 55.0,
      ),
      fillColor: Color(0xFF132030),
      shape: CircleBorder(),
    );
  }
}
