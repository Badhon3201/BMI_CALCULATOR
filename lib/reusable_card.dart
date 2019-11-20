import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
ReusableCard({@required this.colour, this.childCard});
final Color colour;
final Widget childCard;

@override
Widget build(BuildContext context) {
  return Container(
    child: childCard,
    margin: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: colour,
      borderRadius: BorderRadius.circular(10.0),
    ),
    height: 200.0,
    width: 170.0,
  );
}
}