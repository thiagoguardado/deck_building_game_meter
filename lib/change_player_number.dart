import 'package:flutter/material.dart';
import './main.dart';

class ChangePlayerNumber extends StatefulWidget {
  final int minNumberofPlayers;
  final int maxNumberOfPlayers;

  ChangePlayerNumber(
      {this.minNumberofPlayers = 2, this.maxNumberOfPlayers = 6});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChangePlayerNumberState();
  }
}

class ChangePlayerNumberState extends State<ChangePlayerNumber> {
  ChangePlayerNumberState();

  void handleChangePlayerNumberButtonPress(int additional) {
    setState(() {
      AppGlobal.changeNumberOfPlayers(additional);

      if (AppGlobal.numberOfPlayers <= widget.minNumberofPlayers) {
        AppGlobal.numberOfPlayers = widget.minNumberofPlayers;
      } else if (AppGlobal.numberOfPlayers >= widget.maxNumberOfPlayers) {
        AppGlobal.numberOfPlayers = widget.maxNumberOfPlayers;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: ChangePlayerNumberButton(
                "-", AppGlobal.numberOfPlayers > widget.minNumberofPlayers, () {
              handleChangePlayerNumberButtonPress(-1);
            }),
          ),
          Expanded(
            flex: 3,
            child: PlayerNumber(),
          ),
          Expanded(
            flex: 2,
            child: ChangePlayerNumberButton(
                "+", AppGlobal.numberOfPlayers < widget.maxNumberOfPlayers, () {
              handleChangePlayerNumberButtonPress(1);
            }),
          ),
        ],
      ),
    );
  }
}

class ChangePlayerNumberButton extends StatelessWidget {
  final bool _isEnabled;
  final String _text;
  final Function _onPressed;

  ChangePlayerNumberButton(this._text, this._isEnabled, this._onPressed);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(7.5),
      child: RaisedButton(
        onPressed: _isEnabled
            ? () {
                _onPressed();
              }
            : null,
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 50.0),
          child: FittedBox(
            child: Text(
              _text,
              style: new TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0)),
        color: Theme.of(context).buttonColor,
      ),
    );
  }
}

class PlayerNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FittedBox(
              child: Text(
                AppGlobal.numberOfPlayers.toString(),
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: Theme.of(context).buttonColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
