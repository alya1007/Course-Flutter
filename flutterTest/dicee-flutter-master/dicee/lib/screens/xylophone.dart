import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import '../widgets/buttonXylophone.dart';

class Xylophone extends StatefulWidget {
  const Xylophone({super.key});

  @override
  State<Xylophone> createState() => XxylophoneState();
}

class XxylophoneState extends State<Xylophone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[300],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Xylophone App'),
        backgroundColor: Colors.amber[200],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
          Expanded(
            child: xylophoneBtn(
              color: Colors.red,
            fileName: 'assets_note1.wav'),
          ),
          Expanded(
            child: xylophoneBtn(
              color: Colors.orange,
            fileName: 'assets_note1.wav'),
          ),
          Expanded(
            child: xylophoneBtn(
              color: Colors.yellow,
            fileName: 'assets_note1.wav'),
          ),
          Expanded(
            child: xylophoneBtn(
              color: Colors.green,
            fileName: 'assets_note1.wav'),
          ),
          Expanded(
            child: xylophoneBtn(
              color: Colors.teal,
            fileName: 'assets_note1.wav'),
          ),
          Expanded(
            child: xylophoneBtn(
              color: Colors.blue,
            fileName: 'assets_note1.wav'),
          ),
          Expanded(
            child: xylophoneBtn(
              color: Colors.purple,
            fileName: 'assets_note1.wav'),
          ),
        ]),
      ),
    );
  }
}
