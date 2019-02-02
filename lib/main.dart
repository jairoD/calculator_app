import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyHomePageState();
  }

  //_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _outputo = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPresser(String buttonText) {
    if (buttonText == "Clear") {
      _outputo = "0";
      num1 = 0.0;
      num2 = 0.0;
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _outputo = "0";
    } else if (buttonText == ".") {
      if (_outputo.contains(".")) {
        print("ya contiene decimal");
        return;
      } else {
        _outputo = _outputo + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _outputo = (num1 + num2).toString();
      }
      if (operand == "-") {
        _outputo = (num1 - num2).toString();
      }
      if (operand == "*") {
        _outputo = (num1 * num2).toString();
      }
      if (operand == "/") {
        _outputo = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _outputo = _outputo + buttonText;
    }
    print(_outputo);
    setState(() {
      output = double.parse(_outputo).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 12,
              ),
              child: Text(
                output,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _buildButton('7'),
                    _buildButton('8'),
                    _buildButton('9'),
                    _buildButton('/'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton('4'),
                    _buildButton('5'),
                    _buildButton('6'),
                    _buildButton('*'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton('1'),
                    _buildButton('2'),
                    _buildButton('3'),
                    _buildButton('-'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton('.'),
                    _buildButton('0'),
                    _buildButton('00'),
                    _buildButton('+'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    _buildButton('Clear'),
                    _buildButton('='),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String numero) {
    return Expanded(
      child: MaterialButton(
        color: Colors.grey[100],
        padding: EdgeInsets.all(24),
        child: Text(
          numero,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        onPressed: () => buttonPresser(numero),
      ),
    );
  }
}
