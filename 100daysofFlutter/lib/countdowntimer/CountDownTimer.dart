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
    Expanded draggableWheel = Expanded(
      child: Stack(
        children: [
          Container(
            child: GestureDetector(
              onTap: () => print("Test"),
              child: CustomPaint(
                painter: MyPainter(context, 200, 20, DateTime.now()),
              ),
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        body: Container(
          alignment: Alignment.center,
          child: draggableWheel,
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
