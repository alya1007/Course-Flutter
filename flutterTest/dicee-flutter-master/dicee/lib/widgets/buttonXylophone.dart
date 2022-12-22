import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// ignore: camel_case_types
class xylophoneBtn extends StatelessWidget {
  final Color color;
  final String fileName;
  const xylophoneBtn({super.key, required this.color, required this.fileName});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        final player = AudioCache();
        player.play(fileName);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      child: const Text(''),
    );
  }
}