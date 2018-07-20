import 'package:flutter/material.dart';

class PlayerCounter extends StatefulWidget {
  final int initialCounter;

  PlayerCounter(this.initialCounter);

  @override
  _PlayerCounterState createState() => _PlayerCounterState(initialCounter);
}

class _PlayerCounterState extends State<PlayerCounter> {
  int _counter;

  _PlayerCounterState(this._counter);

  void changeCounter(int additionalValue) {
    setState(() {
      _counter += additionalValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MaterialButton(
              child: Text(
                "-",
                style: TextStyle(fontSize: 40.0),
              ),
              onPressed: () => changeCounter(-1),
              color: Theme.of(context).buttonColor,
              height: 50.0,
              minWidth: 75.0,
            ),
            Card(
              color: Theme.of(context).buttonColor,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text(
                  _counter.toString(),
                  style: TextStyle(fontSize: 75.0),
                ),
              ),
              margin: EdgeInsets.all(7.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
            ),
            MaterialButton(
              child: Text(
                "+",
                style: TextStyle(fontSize: 40.0),
              ),
              onPressed: () => changeCounter(1),
              color: Theme.of(context).buttonColor,
              height: 50.0,
              minWidth: 75.0,
            ),
          ],
        ),
      ),
    );
  }
}
