import 'package:bmi_calculator/widgets/roundIconButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class cardContent extends StatefulWidget {
  final String text;
  final String description;
  final int value;
  final void Function() firstOnPressed;
  final void Function() secondOnPressed;
  const cardContent({super.key, required this.text, required this.description, required this.value, required this.firstOnPressed, required this.secondOnPressed});

  @override
  State<cardContent> createState() => _cardContentState();
}

class _cardContentState extends State<cardContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.text.toUpperCase(),
          style: labelTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              widget.value.toString(),
              style: numberStyle,
            ),
            Text(
              widget.description,
              style: labelTextStyle,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconButton(
                  onPress: widget.firstOnPressed,
                  icon: Icons.remove),
              SizedBox(
                width: 10.0,
              ),
              RoundIconButton(
                  onPress: widget.secondOnPressed,
                  icon: Icons.add),
            ],
          ),
        ),
      ],
    );
  }
}
