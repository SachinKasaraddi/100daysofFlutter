import 'package:flutter/material.dart';
import 'dart:async';

class CountDownTimer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  int remainingTime = 10;

  Timer _timer;

  void startCountDownTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (remainingTime == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            remainingTime--;
          });
        }
      },
    );
  }

  void stopCountDownTimer() {
    setState(() {
      _timer.cancel();
      remainingTime = 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                if (isTimerStarted()) {
                  startCountDownTimer();
                } else {
                  stopCountDownTimer();
                }
              },
              child: isTimerStarted() ? Text("Start") : Text("Stop"),
            ),
            Text(
              "$remainingTime",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  bool isTimerStarted() => remainingTime == 10;
}
