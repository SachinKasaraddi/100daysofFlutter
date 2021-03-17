import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget puppyAttributes = Container(
      child: Row(
        children: [
          _setDetails('Age', '2 months'),
          _setDetails('Weight', '1.5kg'),
          _setDetails('Sex', 'Female'),
        ],
      ),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Day 3'),
        ),
        body: Column(
          children: [
            Image.asset('assets/images/radio_puppy.jpeg'),
            puppyAttributes
          ],
        ),
      ),
    );
  }

  Expanded _setDetails(String label, String value) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text(label), Text(value)],
        ),
      ),
    );
  }
}
