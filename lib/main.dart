import 'package:deck_building_game_meter/start_counter_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        accentColor: Colors.blueGrey.shade700,
        backgroundColor: Colors.blueGrey.shade50,
        primaryColor: Colors.blue.shade900,
        buttonColor: Colors.blue,
        disabledColor: Colors.grey.shade100,
      ),
      home: new StartCounterPage(),
    );
  }
}





