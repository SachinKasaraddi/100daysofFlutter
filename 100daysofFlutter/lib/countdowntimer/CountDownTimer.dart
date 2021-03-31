import 'package:flutter/material.dart';
import 'dart:math';

class CountDownTimer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        body: Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.only(top: 400),
            width: 400,
            height: 400,
            child: Align(
              alignment: Alignment.centerRight,
              child: CustomPaint(
                painter: MyPainter(context, 700, 20, DateTime.now()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  //         <-- CustomPainter class
  BuildContext context;
  final indicator = Paint()
    ..color = Color(0xFF007CFA)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  final shortNeedle = Paint()
    ..style = PaintingStyle.fill
    ..strokeWidth = 4
    ..color = Colors.white;

  Color gradientPatchColor;
  double wheelSize;
  double radius;
  double shortNeedleHeight;
  final DateTime dateTime;

  MyPainter(
    this.context,
    this.wheelSize,
    this.shortNeedleHeight,
    this.dateTime,
  ) {
    gradientPatchColor = Theme.of(context).scaffoldBackgroundColor;
    radius = wheelSize / 2;
  }

  double degreeToRadians(double degrees) => degrees * (pi / 180);

  double radianToDegrees(double radians) => radians * (180 / pi);

  @override
  void paint(Canvas canvas, Size size) {
    wheelSize = size.width * 0.5;
    for (double i = 0; i <= 360; i++) {
      if (i % 20 == 0) {
        canvas.drawLine(
            Offset(radius * cos(degreeToRadians(i)),
                radius * sin(degreeToRadians(i))),
            Offset((radius - shortNeedleHeight) * cos(degreeToRadians(i)),
                (radius - shortNeedleHeight) * sin(degreeToRadians(i))),
            shortNeedle);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter old) => false;
}
