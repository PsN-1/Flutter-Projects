import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
              title: Text("Ask Me Anything"), backgroundColor: Colors.blueGrey),
          body: BallPage(),
        ),
      ),
    );

class BallPage extends StatefulWidget {
  @override
  _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int imageNumber = 1;
  void updateImage() {
    setState(() {
      imageNumber = Random().nextInt(5) + 1;
    });
  }
  @override
    Widget build(BuildContext context) {
    return Center(
      child: TextButton(onPressed: () {
        updateImage();
      } ,child: Image.asset('images/ball$imageNumber.png'),),
    );
  }
}

 
