import 'package:flutter/material.dart';

import './start_counter_page.dart';
import './counter_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Deck Building Game meter',
      theme: new ThemeData(
        primarySwatch: Colors.lime,
        buttonColor: Colors.white,
      ),
      home: new StartCounterPage(),
    );
  }
}
