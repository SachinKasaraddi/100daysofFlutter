import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'placeholder_widget.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.yellow)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.home,
              color: Colors.blue,
            ),
            icon: new Icon(
              Icons.home_outlined,
              color: Colors.black26,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.credit_card,
              color: Colors.blue,
            ),
            icon: new Icon(
              Icons.credit_card_outlined,
              color: Colors.black26,
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.people,
              color: Colors.blue,
            ),
            icon: Icon(
              Icons.people_alt_outlined,
              color: Colors.black26,
            ),
            label: 'Recipients',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              color: Colors.blue,
            ),
            icon: Icon(
              Icons.person_outline,
              color: Colors.black26,
            ),
            label: 'Account',
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
