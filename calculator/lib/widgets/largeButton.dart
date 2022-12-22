import 'package:flutter/material.dart';
import '../constants.dart';
import '../results_page.dart';

class LargeButton extends StatefulWidget {
  final String text;
  final void Function() onTap;
  const LargeButton({super.key, required this.text, required this.onTap});

  @override
  State<LargeButton> createState() => _LargeButtonState();
}

class _LargeButtonState extends State<LargeButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 15.0),
        alignment: Alignment.center,
        child: Text(
          widget.text.toUpperCase(),
          style: largeButtonTextStyle,
        ),
        margin: EdgeInsets.only(top: 15.0),
        width: double.infinity,
        height: bottomContainerHeight,
        color: bottomContainerColor,
      ),
    );
  }
}
