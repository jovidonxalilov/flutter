import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loggy/features/widget/app_bar_widget.dart';

class SoatDetail extends StatefulWidget {
  const SoatDetail({super.key});

  @override
  State<SoatDetail> createState() => _SoatDetailState();
}

class _SoatDetailState extends State<SoatDetail> {
  late DateTime date;

  @override
  void initState() {
    super.initState();
    date = DateTime.now();
    Timer.periodic(Duration(seconds: 1), (_) {
      date = DateTime.now();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBarWidget(
        title: "Soat",
        backgroundColor: Colors.black26,
        iconColor: Colors.white,
        textColor: Colors.white,
      ),
      body: Center(
        child: CustomPaint(
          size: Size(300, 300),
          painter: Soat(dateTime: date),
        ),
      ),
    );
  }
}

class Soat extends CustomPainter {
  final DateTime dateTime;

  Soat({required this.dateTime});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2 - 30);
    final radius = 120.0;
    var painBackground = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0;
    canvas.drawCircle(center, radius, painBackground);
    var paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;
    canvas.drawCircle(center, radius, paint);

    final secondAngle = (pi / 30) * dateTime.second;
    final secondLength = radius - 10;
    final endX = center.dx + secondLength * sin(secondAngle);
    final endY = center.dy - secondLength * cos(secondAngle);
    final secondPaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(center, Offset(endX, endY), secondPaint);

    final minutAngle = (pi / 30) * dateTime.minute;
    final minutLength = radius - 15;
    final minuteEndX = center.dx + minutLength * sin(minutAngle);
    final minuteEndY = center.dy - minutLength * cos(minutAngle);
    final minutePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(center, Offset(minuteEndX, minuteEndY), minutePaint);

    final soatAngle = (pi / 6) * (dateTime.hour % 12 + dateTime.minute / 60);
    final soatLength = radius - 25;
    final soatEndX = center.dx + soatLength * sin(soatAngle);
    final soatEndY = center.dy - soatLength * cos(soatAngle);
    final soatPaint = Paint()
      ..color = Colors.deepPurpleAccent
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(center, Offset(soatEndX, soatEndY), soatPaint);
    final radiusCircle = 20.0;
    final fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radiusCircle, fillPaint);

    // var dividerPaint = Paint()
    // ..color = Colors.blueGrey
    // ..strokeWidth = 2.5
    // ..style = PaintingStyle.stroke;
    // dividerPaint.color = Colors.orange;
    // final starPath = Path();
    // starPath.moveTo(size.width / 2 , -7);
    // starPath.lineTo(size.width / 2 , -40);
    // starPath.moveTo(size.width / 2 + 15, -7);
    // starPath.lineTo(size.width / 2 + 20, -30);
    // starPath.moveTo(size.width / 2 + 30, -5);
    // starPath.lineTo(size.width / 2 + 38, -27);
    // starPath.moveTo(size.width / 2 + 100, -5);
    // starPath.lineTo(size.width / 2 + 300, -27);
    // starPath.lineTo(size.width / 2 + 55, 190);
    // starPath.lineTo(size.width / 2 - 3, 160);
    // starPath.lineTo(size.width / 2 - 55, 190);
    // starPath.lineTo(size.width / 2 - 20, 140);
    // starPath.lineTo(size.width / 2 - 70, 120);
    // starPath.lineTo(size.width / 2 - 20, 100);
    // starPath.lineTo(size.width / 2, 50);
    // starPath.close();
    // canvas.drawPath(starPath, dividerPaint);
  }

  @override
  bool shouldRepaint(covariant Soat oldDelegate) {
    return oldDelegate.dateTime.second != dateTime.second;
  }
}
