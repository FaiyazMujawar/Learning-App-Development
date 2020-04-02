import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final audio = AudioCache();
  @override
  Widget build(BuildContext context) {
    void playSound(int num) {
      audio.play('note$num.wav');
    }

    Expanded createButton({Color color, int number}) {
      return Expanded(
        child: FlatButton(
          child: null,
          color: color,
          onPressed: () {
            playSound(number);
          },
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              createButton(color: Colors.red, number: 1),
              createButton(color: Colors.orange, number: 2),
              createButton(color: Colors.yellow, number: 3),
              createButton(color: Colors.green, number: 4),
              createButton(color: Colors.blue, number: 5),
              createButton(color: Colors.orange, number: 6),
              createButton(color: Colors.purple, number: 7),
            ],
          ),
        ),
      ),
    );
  }
}
