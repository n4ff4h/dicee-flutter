import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  /* 
    Note: Variable is instantiated out of the build function
    because we don't want to create it every time the DicePage is rebuilt
  */
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    // This triggers build function so the app redraws where needed
    setState(() {
      // +1 because it generates numbers from 0 to max(excluding max)
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  // () {} This is a void callback or an anonymous function
                  onPressed: () {
                    changeDiceFace();
                  },
                  // String interpolation using $
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  // () {} This is a void callback or an anonymous function
                  onPressed: () {
                    changeDiceFace();
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
