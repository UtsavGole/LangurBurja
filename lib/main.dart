import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LangurBurja(),
    ));

enum Dice { CLUB, KING, DIAMOND, FLAG, HEART, SPADE }

class LangurBurja extends StatefulWidget {
  const LangurBurja({Key? key}) : super(key: key);

  @override
  _LangurBurjaState createState() => _LangurBurjaState();
}

class _LangurBurjaState extends State<LangurBurja> {
  Dice? selectedDice;

  List<Dice> results = [];

  void generateResult() {
    results = [];
    for (int i = 0; i < 6; i++) {
      Random random = Random();
      int getValue = random.nextInt(6) + 1;
      Dice result = getDiceFrom(getValue);
      results.add(result);
    }

    print(results);
  }

  Dice getDiceFrom(int value) {
    switch (value) {
      case 1:
        return Dice.CLUB;
        break;

      case 2:
        return Dice.DIAMOND;
        break;

      case 3:
        return Dice.FLAG;
        break;

      case 4:
        return Dice.HEART;
        break;

      case 5:
        return Dice.KING;
        break;

      case 6:
        return Dice.SPADE;
        break;

      default:
        return Dice.CLUB;
        break;
    }
  }

  List<Widget> getResultInWidget() {
    List<Widget> displayResult = [];
    for (int i = 0; i < results.length; i++) {
      displayResult.add(Expanded(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Image(
          image: AssetImage(AssetFactory(results[i])),
        ),
      )));
    }
    return displayResult;
  }

  String AssetFactory(Dice dice) {
    switch (dice) {
      case Dice.CLUB:
        return "assets/clubs.png";
        break;

      case Dice.DIAMOND:
        return "assets/diamond.png";
        break;

      case Dice.FLAG:
        return "assets/flag.png";
        break;

      case Dice.HEART:
        return "assets/heart.png";
        break;

      case Dice.KING:
        return "assets/kings.png";
        break;

      case Dice.SPADE:
        return "assets/spade.png";
        break;

      default:
        return "uhlulu";
    }
  }

  String checkingWin() {
    for (int i = 0; i < results.length; i++) {
      if (selectedDice == results[i]) {
        return "WIN";
      }
    }
    return "LOSS";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Langur Burja')),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 20,
                          primary: selectedDice == Dice.CLUB
                              ? Colors.green
                              : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedDice = Dice.CLUB;
                          });
                        },
                        child: Image(
                          image: AssetImage('assets/clubs.png'),
                        ),
                      )),
                      Expanded(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 20,
                          primary: selectedDice == Dice.DIAMOND
                              ? Colors.green
                              : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedDice = Dice.DIAMOND;
                          });
                        },
                        child: Image(
                          image: AssetImage('assets/diamond.png'),
                        ),
                      )),
                      Expanded(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 20,
                          primary: selectedDice == Dice.FLAG
                              ? Colors.green
                              : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedDice = Dice.FLAG;
                          });
                        },
                        child: Image(
                          image: AssetImage('assets/flag.png'),
                        ),
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          primary: selectedDice == Dice.HEART
                              ? Colors.green
                              : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedDice = Dice.HEART;
                          });
                        },
                        child: Image(
                          image: AssetImage('assets/heart.png'),
                        ),
                      )),
                      Expanded(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          primary: selectedDice == Dice.KING
                              ? Colors.green
                              : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedDice = Dice.KING;
                          });
                        },
                        child: Image(
                          image: AssetImage('assets/kings.png'),
                        ),
                      )),
                      Expanded(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          primary: selectedDice == Dice.SPADE
                              ? Colors.green
                              : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedDice = Dice.SPADE;
                          });
                        },
                        child: Image(
                          image: AssetImage('assets/spade.png'),
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            Visibility(
              visible: selectedDice != null ? true : false,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      generateResult();
                    });
                  },
                  child: Text(
                    'ROLL DICE',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: getResultInWidget(),
            ),
          ],
        ),
        bottomSheet: Visibility(
          visible: results.length > 0 ? true : false,
          child: Container(
            height: 90,
            width: MediaQuery.of(context).size.width,
            color: Colors.cyan,
            child: Column(
              children: [
                Text(
                  checkingWin(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedDice = null;
                      results = [];
                    });
                  },
                  child: Text(
                    "RESTART",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black87),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
