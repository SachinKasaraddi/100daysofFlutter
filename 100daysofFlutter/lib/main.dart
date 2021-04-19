import 'package:day2/countdowntimer/CountDownTimer.dart';
import 'package:day2/countdowntimer/CountdownTimerView.dart';
import 'package:day2/networking/NetworkApp.dart';
import 'package:day2/networking/NetworkScreen.dart';
import 'package:day2/puppy/Dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: new NetworkScreen(),
    ),
  );
}
