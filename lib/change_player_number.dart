import 'package:flutter/material.dart';

class ChangePlayerNumber extends StatefulWidget {
  final int minNumberofPlayers;
  final int maxNumberOfPlayers;

  ChangePlayerNumber(
      {this.minNumberofPlayers = 2, this.maxNumberOfPlayers = 6});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChangePlayerNumberState(minNumberofPlayers);
  }
}

class ChangePlayerNumberState extends State<ChangePlayerNumber> {
  int _playerNumber;

  ChangePlayerNumberState(this._playerNumber);

  void handleChangePlayerNumberButtonPress(int additional) {
    setState(() {
      _playerNumber += additional;

      if (_playerNumber <= widget.minNumberofPlayers) {
        _playerNumber = widget.minNumberofPlayers;
      } else if (_playerNumber >= widget.maxNumberOfPlayers) {
        _playerNumber = widget.maxNumberOfPlayers;
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
          ChangePlayerNumberButton(
              "-", _playerNumber > widget.minNumberofPlayers, () {
            handleChangePlayerNumberButtonPress(-1);
          }),
          PlayerNumber(_playerNumber),
          ChangePlayerNumberButton(
              "+", _playerNumber < widget.maxNumberOfPlayers, () {
            handleChangePlayerNumberButtonPress(1);
          }),
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
    return RaisedButton(
      onPressed: _isEnabled
          ? () {
              _onPressed();
            }
          : null,
      child: Text(
        _text,
        style: new TextStyle(
          fontSize: 50.0,
          color: Theme.of(context).primaryColor,
        ),
      ),
      shape:
          new RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      color: Theme.of(context).buttonColor,
    );
  }
}

class PlayerNumber extends StatelessWidget {
  final int _playerNumber;

  PlayerNumber(this._playerNumber);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).accentColor,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              _playerNumber.toString(),
              style: new TextStyle(
                fontSize: 180.0,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
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
