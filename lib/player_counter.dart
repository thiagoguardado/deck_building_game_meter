import 'package:flutter/material.dart';

import './game_counter.dart';
import './global_variables.dart';

class PlayerCounter extends StatefulWidget {
  final int initialCounter;
  final GameCounter _gameCounter;

  PlayerCounter(this.initialCounter, this._gameCounter);

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
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: FittedBox(
                  child: Text(
                    "Player",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(children: <Widget>[
                      Expanded(
                        child: Container(),
                      ),
                      Expanded(
                        flex: 2,
                        child: RaisedButton(
                          child: Row(children: [
                            Expanded(
                              child: FittedBox(
                                child: Text(
                                  "-",
                                ),
                              ),
                            ),
                          ]),
                          onPressed: () => changeCounter(-1),
                          color: Theme.of(context).buttonColor,
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ]),
                  ),
                  Expanded(
                    flex: 3,
                    child: Card(
                      color: Theme.of(context).buttonColor,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: FittedBox(
                          child: Text(
                            _counter.toString(),
                          ),
                        ),
                      ),
                      margin: EdgeInsets.all(7.5),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(children: [
                      Expanded(
                        child: Container(),
                      ),
                      Expanded(
                        flex: 2,
                        child: RaisedButton(
                          child: Row(children: [
                            Expanded(
                              child: FittedBox(
                                child: Text(
                                  "+",
                                ),
                              ),
                            ),
                          ]),
                          onPressed: () => changeCounter(1),
                          color: Theme.of(context).buttonColor,
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
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
      children.add(
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 3,
                    child: PlayerCounter(
                        GlobalParameters.initialPlayerCounter, _gameCounter),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ]),
          ),
        ),
      );
    }

    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: _numberOfPlayers * MediaQuery.of(context).size.height/4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),
        ),
      ],
    );
  }
}
