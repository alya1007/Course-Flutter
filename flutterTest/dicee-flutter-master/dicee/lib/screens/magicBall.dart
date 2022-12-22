import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MagicBall extends StatefulWidget {
  const MagicBall({super.key});

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ball = 1;
  void RandomBall(){
    ball = Random().nextInt(5) + 1;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ask me anything'),
        backgroundColor: Colors.blue[100],
      ),
      body: Center(
        child: Container(
          width: 400,
          child: TextButton(
            onPressed: () {
              setState(() {
                RandomBall();
              });
            },
            child: Image.asset('../assets/images/magicApp/ball$ball.png'),
          ),
        ),
      ),
    );
  }
}
