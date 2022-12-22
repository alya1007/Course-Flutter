import 'package:flutter/material.dart';

class dataBox extends StatelessWidget {
  final String text;
  final IconData icon;
  const dataBox({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 15, left: 40, right: 40),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child:
            ListTile(
              leading: Icon(
                icon,
                color: Colors.teal,
              ),
              title: Text(text, style: const TextStyle(
                color: Colors.teal,
                fontSize: 14,
                fontFamily: 'Source Sans Pro',
              ),),
            )
      ),
    );
  }
}
