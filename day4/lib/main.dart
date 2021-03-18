import 'dart:ui';

import 'package:day2/Dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Dashboard());
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
            puppyAttributes,
            puppyNameAndBreed,
            puppyLocation,
            buttonRow
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
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 10),
            ),
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Container puppyNameAndBreed = Container(
    margin: EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Nora',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          'Corgi',
          style: TextStyle(fontSize: 20),
        ),
      ],
    ),
  );

  Container puppyLocation = Container(
    margin: EdgeInsets.only(left: 8, right: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.location_on_outlined),
        Text(
          'near Chinchali road, Raibag, Belgaum, INDIA ',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        Image.asset(
          'assets/images/india.png',
          height: 20,
          width: 20,
        ),
      ],
    ),
  );

  Container buttonRow = Container(
    margin: EdgeInsets.all(16),
    child: Align(
      alignment: Alignment.bottomLeft,
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/dog_footprint.png',
              height: 15,
              width: 15,
            ),
            Text(
              'Adopt me',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        onPressed: () {},
      ),
    ),
  );
}
