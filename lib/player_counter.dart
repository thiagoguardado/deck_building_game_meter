import 'package:flutter/material.dart';

import './main.dart';
import './counter_page.dart';

class PlayerCounter extends StatefulWidget {
  final int initialCounter;
  final GameCounter _gameCounter;

  PlayerCounter(this.initialCounter,this._gameCounter);

  @override
  _PlayerCounterState createState() => _PlayerCounterState(initialCounter);
}

class _PlayerCounterState extends State<PlayerCounter> {
  int _counter;

  _PlayerCounterState(this._counter);

  void changeCounter(int additionalValue) {
    setState(() {
      _counter += additionalValue;
      widget._gameCounter.updateGameCounter(-additionalValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Player",style: TextStyle(fontSize: 25.0),),
            Row(
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
            )
          ],
        ),
      ),
    );
  }
}
