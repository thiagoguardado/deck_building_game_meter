import 'package:deck_building_game_meter/counter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './change_player_number.dart';
import './main.dart';

class StartCounterPage extends StatelessWidget {
  void routeToCounterPage(BuildContext context, int numberOfPlayers) {
    print(AppGlobal.numberOfPlayers);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CounterPage(AppGlobal.numberOfPlayers)));

    print(AppGlobal.numberOfPlayers);
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 6,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FittedBox(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Number of Players",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).primaryColorDark,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    changePlayerWidget,
                    StartButton(() => routeToCounterPage(context, 4)),
                  ]),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
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
    return Row(children: [
      Expanded(
        flex: 1,
        child: Container(),
      ),
      Expanded(
        flex: 3,
        child: RaisedButton(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height / 7),
            child: FittedBox(
              child: Padding(
                padding: EdgeInsets.all(2.5),
                child: Text(
                  "START",
                  style: TextStyle(color: Theme.of(context).buttonColor),
                ),
              ),
            ),
          ),
          color: Theme.of(context).primaryColor,
          onPressed: () => _onPressed(),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(),
      ),
    ]);
  }
}
