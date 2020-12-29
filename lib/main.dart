import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  XylophoneApp({Key key}) : super(key: key);

  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  void playSound(int i) {
    final player = AudioCache();
    player.loadAll([
      'note1.wav',
      'note2.wav',
      'note3.wav',
      'note4.wav',
      'note5.wav',
      'note6.wav',
      'note7.wav'
    ]);
    player.play('note$i.wav');
    player.clearCache();
  }

  Expanded buildKey({Color color, int i, String text}) {
    return Expanded(
      child: FlatButton(
        child: Text(
          text,
        ),
        color: color,
        onPressed: () {
          setState(() {
            playSound(i);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          shape: CircleBorder(
            side: BorderSide(width: .1),
          ),
          title: Center(
            child: Text(
              'Xylophone',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(color: Colors.red, i: 1, text: 'wav@1'),
            buildKey(color: Colors.orange, i: 2, text: 'wav@2'),
            buildKey(color: Colors.yellow, i: 3, text: 'wav@3'),
            buildKey(color: Colors.green, i: 4, text: 'wav@4'),
            buildKey(color: Colors.green[100], i: 5, text: 'wav@5'),
            buildKey(color: Colors.teal[100], i: 6, text: 'wav@6'),
            buildKey(color: Colors.teal[50], i: 7, text: 'wav@7'),
          ],
        )),
      ),
    );
  }
}
