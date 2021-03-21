import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:day2/Puppy.dart';
import 'package:flutter/material.dart';

class PuppyDetails extends StatelessWidget {
  static const routeName = '/puppyDetails';

  @override
  Widget build(BuildContext context) {
    final Puppy puppy = ModalRoute.of(context).settings.arguments;
    final int age = puppy.age;
    final double weight = puppy.weight;
    final String sex = puppy.isMale ? 'Male' : 'Female';

    Widget puppyAttributes = Container(
      child: Row(
        children: [
          _setDetails('Age', '$age months'),
          _setDetails('Weight', '$weight kg'),
          _setDetails('Sex', sex),
        ],
      ),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            Image.asset(puppy.imagePath),
            puppyAttributes,
            puppyNameAndBreed(puppy.name, puppy.breed),
            puppyLocation(puppy.address),
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

  Container puppyNameAndBreed(String name, String breed) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            breed,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Container puppyLocation(String address) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.location_on_outlined),
          Text(
            address,
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
  }

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
