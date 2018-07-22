import 'package:flutter/material.dart';

import './player_counter.dart';
import './global_variables.dart';
import './main.dart';

class CounterPage extends StatelessWidget {
  final int _numberOfPlayers;

  CounterPage(this._numberOfPlayers);

  @override
  Widget build(BuildContext context) {
    GameCounter _gameCounter = GameCounter();
    PlayersCounters _playersCounters =
        PlayersCounters(_numberOfPlayers, _gameCounter);

    AppGlobal.startGameCounter();

    return Scaffold(
      // appBar: new AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: _playersCounters),
          _gameCounter,
        ],
      ),
    );
  }
}

class GameCounter extends StatefulWidget {
  final _GameCounterState state = _GameCounterState();

  void updateGameCounter(int additionalValue) {
    state.updateGameCounter(additionalValue);
  }

  @override
  _GameCounterState createState() => state;
}

class _GameCounterState extends State<GameCounter> {
  void updateGameCounter(int additionalValue) {
    setState(() {
      AppGlobal.changeGameCounter(additionalValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      height: 100.0,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Game:",
                style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColorDark),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 7.5)),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  AppGlobal.gameCounter.toString(),
                  style: TextStyle(
                      fontSize: 50.0,
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlayersCounters extends StatelessWidget {
  final int _numberOfPlayers;
  final GameCounter _gameCounter;

  PlayersCounters(this._numberOfPlayers, this._gameCounter);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    List<Widget> children = <Widget>[];

    for (var i = 0; i < _numberOfPlayers; i++) {
      children.add(Expanded(
          child: PlayerCounter(
              GlobalParameters.initialPlayerCounter, _gameCounter)));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}
