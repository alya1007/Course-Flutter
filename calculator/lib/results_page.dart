import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/inputPage.dart';
import 'package:bmi_calculator/widgets/inputBox.dart';
import 'package:bmi_calculator/widgets/largeButton.dart';
import 'package:flutter/material.dart';
import 'resultsBrain.dart';

class ResultsPage extends StatefulWidget {
  final String bmiValue;
  final String result;
  final String interpretation;
  const ResultsPage(
      {required this.bmiValue,
      required this.result,
      required this.interpretation});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  TextStyle resultStyle = TextStyle();

  TextStyle ResultStyle() {
    if (widget.result == 'Normal') {
      resultStyle = resultNormal;
    } else if (widget.result == 'Overweight') {
      resultStyle = resultOver;
    } else if (widget.result == 'Underweight') {
      resultStyle = resultUnder;
    }
    return resultStyle;
  }

  double BMI = 26.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI calculator'.toUpperCase()),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.only(top: 30.0),
            child: Center(
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 40.0,
                  color: activeTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          InputBox(
            backgroundColor: activeCardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.result,
                  style: ResultStyle(),
                ),
                Center(
                  child: Text(
                    widget.bmiValue,
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                      color: activeTextColor,
                    ),
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  widget.interpretation,
                  style: labelTextStyle,
                ),
              ],
            ),
          ),
          LargeButton(
            onTap: () {
              Navigator.pop(context);
            },
            text: 'Re-calculate',
          ),
        ],
      ),
    );
  }
}
