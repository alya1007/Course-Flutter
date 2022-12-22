import 'package:bmi_calculator/resultsBrain.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/widgets/cardContent.dart';
import 'package:bmi_calculator/widgets/iconAndText.dart';
import 'package:bmi_calculator/widgets/inputBox.dart';
import 'package:bmi_calculator/widgets/largeButton.dart';
import 'package:bmi_calculator/widgets/roundIconButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int Age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                InputBox(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  backgroundColor: selectedGender == Gender.male
                      ? activeCardColor
                      : inactiveCardColor,
                  child: IconAndTextWidget(
                    icon: FontAwesomeIcons.mars,
                    text: 'MALE',
                    textColor: selectedGender == Gender.male
                        ? activeTextColor
                        : inactiveTextColor,
                  ),
                ),
                InputBox(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  backgroundColor: selectedGender == Gender.female
                      ? activeCardColor
                      : inactiveCardColor,
                  child: IconAndTextWidget(
                    icon: FontAwesomeIcons.venus,
                    text: 'FEMALE',
                    textColor: selectedGender == Gender.female
                        ? activeTextColor
                        : inactiveTextColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                InputBox(
                  backgroundColor: activeCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height'.toUpperCase(),
                        style: labelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: numberStyle,
                          ),
                          Text(
                            'cm',
                            style: labelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          thumbColor: sliderThumbColor,
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          overlayColor: sliderThumbOverlayColor,
                          activeTrackColor: activeSliderColor,
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                          inactiveColor: inactiveSliderColor,
                          min: sliderMin,
                          max: sliderMax,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                InputBox(
                  backgroundColor: activeCardColor,
                  child: cardContent(
                    text: 'weight',
                    description: 'kg',
                    value: weight,
                    firstOnPressed: () {
                      setState(() {
                        weight--;
                      });
                    },
                    secondOnPressed: () {
                      setState(() {
                        weight++;
                      });
                    },
                  ),
                ),
                InputBox(
                  backgroundColor: activeCardColor,
                  child: cardContent(
                    text: 'Age',
                    description: '',
                    value: Age,
                    firstOnPressed: () {
                      setState(() {
                        Age--;
                      });
                    },
                    secondOnPressed: () {
                      setState(() {
                        Age++;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          LargeButton(
            onTap: () {
              ResultsBrain resultBrain =
                  new ResultsBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage(
                      bmiValue: resultBrain.CalculateBMI(),
                      result: resultBrain.GetResult(),
                      interpretation: resultBrain.getInterpretation(),
                    );
                  },
                ),
              );
            },
            text: 'Calculate',
          ),
        ],
      ),
    );
  }
}

enum Gender {
  male,
  female,
}
