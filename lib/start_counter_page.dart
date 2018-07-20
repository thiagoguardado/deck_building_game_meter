import 'package:deck_building_game_meter/counter_page.dart';
import 'package:deck_building_game_meter/global_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartCounterPage extends StatefulWidget {
  
  @override
  StartCounterPageState createState() => new StartCounterPageState();

}

class StartCounterPageState extends State<StartCounterPage> {

  int playerNumber = 2;
  
  final int minNumberofPlayers = 2;
  final int maxNumberOfPlayers = 6;

  void handleChangePlayerNumberButtonPress(int additional)
  {
    setState(() {
        
        playerNumber += additional;

        if(playerNumber <= minNumberofPlayers)
        {
          playerNumber = minNumberofPlayers; 
        } else if (playerNumber >= maxNumberOfPlayers)
        {
          playerNumber = maxNumberOfPlayers;
        }
      });
  }

  Widget sideButton(String text, VoidCallback onPressAction)
  {
    return new RaisedButton(
        child: Text(
            text,
            style: new TextStyle(
              fontSize: 50.0,
              color: Theme.of(context).buttonColor,
            ),
          ),
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
        color: Colors.white,
        onPressed: onPressAction,
        );

  }

  Widget leftButton() {
    return sideButton("-", playerNumber <= minNumberofPlayers ? null : () => handleChangePlayerNumberButtonPress(-1));
  }

  Widget rightButton() {
    return sideButton("+", playerNumber >= maxNumberOfPlayers ? null : () => handleChangePlayerNumberButtonPress(1));
   }

  void routeToCounterPage()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CounterPage()));
  }

  @override
  Widget build(BuildContext context) {

    // center number
    final Widget numberOfPlayers = new Text(
      playerNumber.toString(),
      style: new TextStyle(
        fontSize: 180.0,
        color: Theme.of(context).buttonColor,
        fontWeight: FontWeight.bold,
      ),);

    // start button
    final Widget startButton = new RaisedButton(
      child: Text(
        "START",
        style: TextStyle(
          fontSize: 75.0,
          color: Colors.white),
      ),
      color: Theme.of(context).buttonColor,
      onPressed: () => routeToCounterPage(),
    );

    // return
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          GlobalParameters.gameName),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Row(
              children:  [leftButton(),numberOfPlayers,rightButton()],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            new SizedBox(height: 50.0,),
            startButton,
          ],
        ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      );
  }
}

class ChangePlayerNumberButton extends RaisedButton {
  ChangePlayerNumberButton (String text, VoidCallback func, BuildContext context, bool isEnabled): super(
    onPressed:func,
    child: Text(
        text,
        style: new TextStyle(
          fontSize: 50.0,
          color: Theme.of(context).buttonColor,
        ),
      ),
    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
    color: Colors.white,
    
  );

}