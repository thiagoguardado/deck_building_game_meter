import 'package:flutter/material.dart';

import './player_counter.dart';
import './global_variables.dart';

class CounterPage extends StatelessWidget {
  final int _numberOfPlayers;

  CounterPage(this._numberOfPlayers);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(),
      body: Center(child: PlayersCounters(_numberOfPlayers),
        ),
      );
  }
}

class PlayersCounters extends StatelessWidget {
  final int _numberOfPlayers;

  PlayersCounters(this._numberOfPlayers);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    List<PlayerCounter> children = <PlayerCounter>[];

    for (var i = 0; i < _numberOfPlayers; i++) {
      children.add(PlayerCounter(GlobalParameters.initialPlayerCounter));
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
