import 'package:flutter/material.dart';

import './main.dart';

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
      child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      border: Border(
                          top: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 7.5)),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 7.5)),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: FittedBox(
                          child: Text(
                            AppGlobal.gameCounter.toString(),
                            style: TextStyle(
                                color: Theme.of(context).primaryColorDark,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
