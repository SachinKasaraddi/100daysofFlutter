import 'package:flutter/cupertino.dart';
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
      childAspectRatio: 0.75,
      children: <Widget>[
        _puppyItem("assets/images/pet3.jpeg", "Puppy", true, "Pippa", "Border colli"),
        _puppyItem("assets/images/pet4.jpeg", "Puppy", true, "Pickle", "Bulldog"),
        _puppyItem("assets/images/pet5.jpeg", "Adult", false, "Blossom", "Maltese puddle"),
        _puppyItem("assets/images/pet6.jpeg", "Puppy", true, "Hailey", "Pitbull"),
        _puppyItem("assets/images/pet7.jpeg", "Puppy", true, "Kiki", "Spaniel"),
        _puppyItem("assets/images/pet8.jpeg", "Adult", false, "Missy", "Cross"),
        _puppyItem("assets/images/pet1.jpeg", "Puppy", true, "Nora", "Corgi"),
        _puppyItem("assets/images/pet2.jpeg", "Adult", false, "Basil", "Cross"),
        _puppyItem("assets/images/pet9.jpeg", "Puppy", true, "Tessa", "Border colli"),
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
              'Adopt Me!',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto-Bold',
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: puppiesList,
        ),
      ),
    );
  }

  Card _puppyItem(String imagePath, String puppyType, bool isMale, String name,
      String breed) {
    return Card(
      elevation: 1,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            child: Image.asset(
              imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            decoration: BoxDecoration(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      color: isMale ? Color(0xFF8A6A18) : Color(0xFF104A7D),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 8),
            child: Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  fontFamily: 'Roboto-Bold'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: Text(
              breed,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Roboto-Light'),
            ),
          ),
        ],
      ),
    );
  }
}
