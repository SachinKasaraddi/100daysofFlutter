import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GridView puppiesList = GridView.count(
      primary: false,
      padding: EdgeInsets.all(16),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        _puppyItem("assets/images/pet1.jpeg", "Puppy", true, "Nora", "Corgi"),
        _puppyItem("assets/images/pet2.jpeg", "Adult", false, "Basil", "Cross"),
        _puppyItem("assets/images/pet3.jpeg", "Puppy", true, "Nora", "Corgi"),
        _puppyItem("assets/images/pet4.jpeg", "Puppy", true, "Basil", "Cross"),
        _puppyItem("assets/images/pet5.jpeg", "Adult", false, "Nora", "Corgi"),
        _puppyItem("assets/images/pet6.jpeg", "Puppy", true, "Basil", "Cross"),
        _puppyItem("assets/images/pet7.jpeg", "Puppy", true, "Nora", "Corgi"),
        _puppyItem("assets/images/pet8.jpeg", "Adult", false, "Basil", "Cross"),
        _puppyItem("assets/images/pet9.jpeg", "Puppy", true, "Basil", "Cross"),
      ],
    );

    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Adopt me!',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          body: puppiesList),
    );
  }

  Card _puppyItem(String imagePath, String puppyType, bool isMale, String name,
      String breed) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(imagePath),
          ),
          Row(
            children: [
              Card(
                color: isMale ? const Color(0xFFFAE6E6) : Color(0xFFE2EEF9),
                elevation: 0,
                margin: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, top: 4, right: 15, bottom: 4),
                    child: Text(
                      puppyType,
                      style: TextStyle(
                          color: isMale ? Color(0xFF104A7D) : Color(0xFF104A7D)),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
