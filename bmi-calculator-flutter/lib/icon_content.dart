import 'package:bmi_calculator/constansts.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;

  IconContent({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        icon,
        size: 80,
      ),
      SizedBox(
        height: 15,
      ),
      Text(
        label,
        style: kLabelTextStyle,
      )
    ]);
  }
}
