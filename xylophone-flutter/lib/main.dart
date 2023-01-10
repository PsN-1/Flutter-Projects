import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int number) {
    final player = AudioPlayer();
    player.setSourceAsset('note$number.wav');
    player.resume();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              soundButton(1, Colors.red),
              soundButton(2, Colors.blue),
              soundButton(3, Colors.green),
              soundButton(4, Colors.grey),
              soundButton(5, Colors.teal),
              soundButton(6, Colors.lime),
              soundButton(7, Colors.amber),
            ],
          ),
        ),
      ),
    );
  }

  Expanded soundButton(int soundNumber, Color color) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: color),
        onPressed: () {
          playSound(soundNumber);
        },
        child: null,
      ),
    );
  }
}
