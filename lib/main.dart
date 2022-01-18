import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

import 'buttons.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  CalculatorAppState createState() => CalculatorAppState();
}

class CalculatorAppState extends State<CalculatorApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Center(
            child: Text("CALCULATOR"),
          ),
        ),
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      _history,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF545F61),
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment(1.0, 1.0),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      _expression,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment(1.0, 1.0),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: 'AC',
                      fillColor: 0xFFF61F67,
                      textColor: 0xFFfefae0,
                      textSize: 25,
                      callback: allClear,
                    ),
                    CalcButton(
                      text: 'C',
                      fillColor: 0xFFFF9100,
                      textColor: 0xFFfefae0,
                      callback: clear,
                    ),
                    CalcButton(
                      text: '%',
                      fillColor: 0xFFFF9100,
                      textColor: 0xFFfefae0,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '/',
                      fillColor: 0xFF4FC3F7,
                      textColor: 0xFF03071e,
                      callback: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '7',
                      fillColor: 0xFF3D3D3D,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '8',
                      fillColor: 0xFF3D3D3D,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '9',
                      fillColor: 0xFF3D3D3D,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '*',
                      fillColor: 0xFF4FC3F7,
                      textColor: 0xFF03071e,
                      textSize: 30,
                      callback: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '4',
                      fillColor: 0xFF3D3D3D,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '5',
                      fillColor: 0xFF3D3D3D,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '6',
                      fillColor: 0xFF3D3D3D,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '-',
                      fillColor: 0xFF4FC3F7,
                      textColor: 0xFF03071e,
                      textSize: 38,
                      callback: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '1',
                      fillColor: 0xFF3D3D3D,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '2',
                      fillColor: 0xFF3D3D3D,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '3',
                      fillColor: 0xFF3D3D3D,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '+',
                      fillColor: 0xFF4FC3F7,
                      textColor: 0xFF03071e,
                      textSize: 30,
                      callback: numClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '0',
                      fillColor: 0xFF3D3D3D,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '00',
                      fillColor: 0xFF3D3C3C,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                      textSize: 26,
                    ),
                    CalcButton(
                      text: '.',
                      fillColor: 0xFF3D3C3C,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '=',
                      fillColor: 0xFF03FF3A,
                      textColor: 0xFF03071e,
                      callback: evaluate,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
