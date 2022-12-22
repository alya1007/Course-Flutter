import 'package:flutter/cupertino.dart';

class InputBox extends StatefulWidget {
  final Color backgroundColor;
  final Widget? child;
  final void Function()? onTap;
  const InputBox({super.key, required this.backgroundColor, this.child, this.onTap});

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          child: widget.child,
          margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
        ),
      ),
    );
  }
}