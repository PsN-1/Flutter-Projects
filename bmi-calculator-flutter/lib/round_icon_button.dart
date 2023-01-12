import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundIconButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      // elevation: 6,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF44C4F5E),
    );
  }
}
