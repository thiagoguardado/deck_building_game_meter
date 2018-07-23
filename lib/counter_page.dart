import 'package:flutter/material.dart';

import './main.dart';
import './game_counter.dart';
import './player_counter.dart';

class CounterPage extends StatelessWidget {
  final int _numberOfPlayers;

  CounterPage(this._numberOfPlayers);

  @override
  Widget build(BuildContext context) {
    GameCounter _gameCounter = GameCounter();
    PlayersCounters _playersCounters =
        PlayersCounters(_numberOfPlayers, _gameCounter);

    AppGlobal.numberOfPlayers = _numberOfPlayers;
    AppGlobal.startGameCounter();

    return Scaffold(
      // appBar: new AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(flex: 5, child: _playersCounters),
          Expanded(flex: 1, child: _gameCounter),
        ],
      ),
    );
  }
}
