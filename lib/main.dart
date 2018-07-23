import 'package:flutter/material.dart';

import './start_counter_page.dart';
import './counter_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Deck Building Game meter',
      theme: ThemeData.dark(),
      // theme: new ThemeData(
      //   primarySwatch: Colors.indigo,
      //   buttonColor: Colors.white,
      // ),
      home: new StartCounterPage(),
    );
  }
}

class AppGlobal {
  static int numberOfPlayers = 2;
  static int gamePointsPerPlayer = 30;
  static int gameCounter = 0;

  static void changeNumberOfPlayers(int addPlayer) {
    numberOfPlayers += addPlayer;
  }

  static void startGameCounter() {
    gameCounter = gamePointsPerPlayer * numberOfPlayers;
    print(gameCounter);
  }

  static void changeGameCounter(int addNumber)
  {
    gameCounter += addNumber;
    if (gameCounter <0) gameCounter = 0; 
  }
}
