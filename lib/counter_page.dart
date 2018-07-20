
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(),
      body: new Center(
        child: Container(
          color: Colors.black,
          height: 100.0,
          width: 100.0,
        ),
      ),
    );
  }
}