import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:day2/puppy/Puppy.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 10,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              puppy.imagePath,
              height: 250,
              fit: BoxFit.fitWidth,
            ),
            puppyAttributes,
            puppyNameAndBreed(puppy.name, puppy.breed),
            puppyLocation(puppy.about),
            Container(
              margin: const EdgeInsets.only(left: 16, bottom: 8,top: 16),
              child: Text(
                "About",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                margin: const EdgeInsets.all(16),
                width: 150,
                child: Text(puppy.address)),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(16),
                child: buttonRow,
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded _setDetails(String label, String value) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
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

  Row buttonRow = Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Expanded(
        child: Container(
          margin: EdgeInsets.all(8),
          height: 60,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
            onPressed: () {},
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //Center Row contents horizontally,
                crossAxisAlignment: CrossAxisAlignment.center,
                //Center Row contents vertically,
                children: [
                  IconButton(
                      icon: Image.asset(
                        'assets/images/dog_footprint.png',
                        color: Colors.white,
                        height: 25,
                      ),
                      onPressed: () {}),
                  Text(
                    'Adopt',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      Container(
        height: 60,
        margin: EdgeInsets.all(8),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
          onPressed: () {},
          child: Icon(Icons.call),
        ),
      )
    ],
  );
}
