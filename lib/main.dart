import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Text(
                output,
                style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // Buttons area
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      buildButton("AC", Colors.grey, Colors.black),
                      buildButton("+/-", Colors.grey, Colors.black),
                      buildButton("%", Colors.grey, Colors.black),
                      buildButton("÷", Colors.orange, Colors.white),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      buildButton("7", Colors.grey[850]!, Colors.white),
                      buildButton("8", Colors.grey[850]!, Colors.white),
                      buildButton("9", Colors.grey[850]!, Colors.white),
                      buildButton("×", Colors.orange, Colors.white),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      buildButton("4", Colors.grey[850]!, Colors.white),
                      buildButton("5", Colors.grey[850]!, Colors.white),
                      buildButton("6", Colors.grey[850]!, Colors.white),
                      buildButton("-", Colors.orange, Colors.white),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      buildButton("1", Colors.grey[850]!, Colors.white),
                      buildButton("2", Colors.grey[850]!, Colors.white),
                      buildButton("3", Colors.grey[850]!, Colors.white),
                      buildButton("+", Colors.orange, Colors.white),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      buildButton("0", Colors.grey[850]!, Colors.white,
                          flex: 2),
                      buildButton(".", Colors.grey[850]!, Colors.white),
                      buildButton("=", Colors.orange, Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildButton(String buttonText, Color buttonColor, Color textColor,
      {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(24),
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            onButtonPressed(buttonText);
          },
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 28,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  void onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        output = "0";
      } else if (buttonText == "=") {
      } else {
        if (output == "0") {
          output = buttonText;
        } else {
          output += buttonText;
        }
      }
    });
  }
}
