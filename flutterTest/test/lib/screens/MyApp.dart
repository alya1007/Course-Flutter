import 'package:flutter/material.dart';
import 'package:test/widgets/frontDataBox.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      // ignore: prefer_const_constructors
      home: Scaffold(
          backgroundColor: Colors.teal,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('../../assets/images/pfp.jpg'),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Alexandra Konjevic',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    'Flutter Developer'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.teal.shade100,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceSansPro',
                      letterSpacing: 2.5,
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 20,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                const dataBox(icon: Icons.phone, text: 'alea.konj@gmail.com'),
                const dataBox(icon: Icons.email, text: '(+373) 673 70 657'),
              ],
            ),
          )),
    );
  }
}
