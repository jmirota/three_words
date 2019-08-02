import 'package:flutter/material.dart';
import 'package:three_words/three_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Three Words Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {

  final _words = Words();
  int _numberOfWords = 5;
  List<String> wordsList = [];

  @override
  Widget build(BuildContext context) {
    wordsList = _words.randomWords(number: _numberOfWords);
    return Scaffold(
      appBar: AppBar(title: Text('Three Words Demo Page'),),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Number of words:  $_numberOfWords'),
              Slider(
                value: _numberOfWords.toDouble(),
                min: 3,
                max: 19,
                onChanged: (double value) {
                setState(() {
                  _numberOfWords = value.floor();
                });
              },


              ),
              Text('Random words :'),
              for (var i = 0; i < _numberOfWords; i++) ... {
                Text(wordsList[i] + " ")
              }
            ],
          ),
        ),
      ),
    );
  }
}
