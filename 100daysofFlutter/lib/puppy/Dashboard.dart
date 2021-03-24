import 'package:day2/puppy/Puppy.dart';
import 'package:day2/puppy/PuppyDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final puppyList = Puppy.getPuppiesList();

    GridView puppyListGridView = GridView.builder(
        itemCount: puppyList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        semanticChildCount: 2,
        itemBuilder: (BuildContext ctx, index) {
          return _puppyItem(ctx, puppyList[index]);
        });

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
          padding: EdgeInsets.all(16),
          color: Colors.white,
          child: puppyListGridView,
        ),
      ),
      routes: {PuppyDetails.routeName: (context) => PuppyDetails()},
    );
  }

  InkWell _puppyItem(BuildContext context, Puppy puppy) {
    final String imagePath = puppy.imagePath;
    final String puppyType = puppy.puppyType;
    final bool isMale = puppy.isMale;
    final String name = puppy.name;
    final String breed = puppy.breed;
    return InkWell(
      child: Card(
        elevation: 1,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
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
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          PuppyDetails.routeName,
          arguments: puppy,
        );
      },
    );
  }
}
