import 'package:deck_building_game_meter/counter_page.dart';
import 'package:deck_building_game_meter/global_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './change_player_number.dart';

class StartCounterPage extends StatelessWidget {
  void routeToCounterPage(BuildContext context, int numberOfPlayers) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CounterPage(numberOfPlayers)));
  }

  @override
  Widget build(BuildContext context) {
    ChangePlayerNumber changePlayerWidget = ChangePlayerNumber(
      minNumberofPlayers: 2,
      maxNumberOfPlayers: 6,
    );

    return new Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Number of Players",
              style: TextStyle(
                  fontSize: 40.0,
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            changePlayerWidget,
            SizedBox(
              height: 20.0,
            ),
            StartButton(() => routeToCounterPage(context,4)),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}

class StartButton extends StatelessWidget {
  final Function _onPressed;

  StartButton(this._onPressed);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        "START",
        style: TextStyle(fontSize: 75.0, color: Theme.of(context).buttonColor),
      ),
      color: Theme.of(context).primaryColor,
      onPressed: () => _onPressed(),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    );
  }
}
