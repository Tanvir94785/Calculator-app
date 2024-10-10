import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String displayText = '0'; // Result display
  String inputText = ''; // Full input display
  double num1 = 0;
  double num2 = 0;
  String result = '0';
  String operator = '';

  void buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      result = '0';
      inputText = '';
      num1 = 0;
      num2 = 0;
      operator = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '×' ||
        buttonText == '÷') {
      num1 = double.parse(result);
      operator = buttonText;
      inputText += buttonText; // Update input string
      result = '0';
    } else if (buttonText == '=') {
      num2 = double.parse(result);
      if (operator == '+') {
        result = (num1 + num2).toString();
      } else if (operator == '-') {
        result = (num1 - num2).toString();
      } else if (operator == '×') {
        result = (num1 * num2).toString();
      } else if (operator == '÷') {
        result = (num1 / num2).toString();
      }
      inputText += " = $result"; // Add result to input string
    } else {
      if (result == '0') {
        result = buttonText;
      } else {
        result = result + buttonText;
      }
      inputText += buttonText; // Add each number to input string
    }

    setState(() {
      displayText = result;
    });
  }

  Widget buildButton(String buttonText, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20),
            backgroundColor: color,
          ),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          // Full input display
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Text(
                inputText,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          // Result display
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Text(
                displayText,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  buildButton('7', Colors.grey),
                  buildButton('8', Colors.grey),
                  buildButton('9', Colors.grey),
                  buildButton('÷', Colors.blue),
                ],
              ),
              Row(
                children: [
                  buildButton('4', Colors.grey),
                  buildButton('5', Colors.grey),
                  buildButton('6', Colors.grey),
                  buildButton('×', Colors.blue),
                ],
              ),
              Row(
                children: [
                  buildButton('1', Colors.grey),
                  buildButton('2', Colors.grey),
                  buildButton('3', Colors.grey),
                  buildButton('-', Colors.blue),
                ],
              ),
              Row(
                children: [
                  buildButton('C', Colors.red),
                  buildButton('0', Colors.grey),
                  buildButton('=', Colors.green),
                  buildButton('+', Colors.blue),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
