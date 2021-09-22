import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> restaurants = [
    'McDonald\'s',
    'Roscoe\'s Chicken & Waffles',
    'Olive Garden',
    'Pizza Hut',
    'Panda Express',
    'Subway',
  ];

  int? currentIndex;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('What do you want to eat'),
            if (currentIndex != null)
              Text(restaurants[currentIndex!],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: updateIndex,
              child: Text(
                'Pick Restaurant',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple)),
            )
          ],
        )),
      ),
    );
  }

  void updateIndex() {
    final random = Random();
    final index = random.nextInt(restaurants.length);

    setState(() {
      currentIndex = index;
    });
  }
}
