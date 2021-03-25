import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path_drawing/path_drawing.dart';

class CountDownTimer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with SingleTickerProviderStateMixin {
  int remainingTime = 10;
  AnimationController _animationController;
  Animation<double> _animation;

  Timer _timer;
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _animationController = new AnimationController(
      vsync: this,
      duration: Duration(seconds: remainingTime),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));
  }

  void startCountDownTimer(int remainingTimeValue) {
    if (isTimerStarted()) {
      remainingTime = remainingTimeValue;
      const oneSec = const Duration(seconds: 1);
      _timer = new Timer.periodic(
        oneSec,
        (Timer timer) {
          if (remainingTime == 0) {
            setState(() {
              timer.cancel();
              remainingTime = 0;
            });
          } else {
            setState(() {
              remainingTime--;
            });
          }
        },
      );
    } else {
      setState(() {
        _timer.cancel();
        remainingTime = 0;
      });
    }

    if (_animationController.isAnimating) {
      _animationController.stop();
    } else {
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        body: Align(
          alignment: Alignment.centerRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150,
                height: 50,
                child: TextFormField(
                  controller: textController,
                  decoration: InputDecoration(
                    labelText: 'Enter time',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  startCountDownTimer(int.parse(textController.text));
                },
                child: isTimerStarted() ? Text("Start") : Text("Stop"),
              ),
              Text(
                isTimerStarted() ? "Press start" : "$remainingTime",
                style: TextStyle(color: Colors.white),
              ),
              Align(
                alignment: Alignment.topRight,
                child: AnimatedBuilder(
                    animation: _animation,
                    child: CustomPaint(
                      size: Size(300, 300),
                      painter: MyPainter(),
                    ),
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _animation.value,
                        child: child,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isTimerStarted() => remainingTime == 10 || remainingTime == 0;
}

class MyPainter extends CustomPainter {
  //         <-- CustomPainter class
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;

    var startPoint = Offset(0, size.height / 2);
    var controlPoint1 = Offset(size.width / 4, size.height / 3);
    var controlPoint2 = Offset(3 * size.width / 4, size.height / 3);
    var endPoint = Offset(size.width, size.height / 2);

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
        controlPoint2.dy, endPoint.dx, endPoint.dy);

    canvas.drawPath(
      dashPath(
        path,
        dashArray: CircularIntervalList<double>(<double>[15.0, 10.5]),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
