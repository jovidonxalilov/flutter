import 'package:flutter/material.dart';
import 'package:loggy/features/widget/app_bar_widget.dart';

class CanvasWidget extends StatefulWidget {
  const CanvasWidget({super.key});

  @override
  State<CanvasWidget> createState() => _CanvasWidgetState();
}

class _CanvasWidgetState extends State<CanvasWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(title: "Canvas"),
      body: Center(
        child: CustomPaint(
          size: Size(300, 300),
          painter: Qorbobo(),
        ),
      ),
    );
  }
}

class Qorbobo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;
    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 100, paint);
    // var rect = Rect.fromLTWH(50, 200, 200, 100);
    // canvas.drawOval(rect, paint);

    // var paintRect = Paint()
    //   ..color = Colors.blue
    //   ..style = PaintingStyle.fill;
    // var rest = Rect.fromLTWH(50, 50, 200, 100);
    // canvas.drawRect(rest, paintRect);
    //
    // paint.color = Colors.purple;
    // var path = Path();
    // path.moveTo(size.width / 2, size.height / 2 - 50);
    // path.lineTo(size.width / 2 + 30, size.height / 2 + 50);
    // path.lineTo(size.width / 2 - 30, size.height / 2 + 50);
    // path.close();
    // canvas.drawPath(path, paint);

    paint.color = Colors.orange;
    final starPath = Path();
    starPath.moveTo(size.width / 2, 50);
    starPath.lineTo(size.width / 2 + 20, 100);
    starPath.lineTo(size.width / 2 + 70, 120);
    starPath.lineTo(size.width / 2 + 20, 140);
    starPath.lineTo(size.width / 2 + 55, 190);
    starPath.lineTo(size.width / 2 - 3, 160);
    starPath.lineTo(size.width / 2 - 55, 190);
    starPath.lineTo(size.width / 2 - 20, 140);
    starPath.lineTo(size.width / 2 - 70, 120);
    starPath.lineTo(size.width / 2 - 20, 100);
    starPath.lineTo(size.width / 2, 50);
    starPath.close();
    canvas.drawPath(starPath, paint);

    var textPainter = TextPainter(
        text: TextSpan(
          text: 'salom, Flutter',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        textDirection: TextDirection.ltr);
    textPainter.layout(minWidth: 0, maxWidth: size.width);
    var offset = Offset(50, 200);
    textPainter.paint(canvas, offset);
    final shader =
        LinearGradient(colors: [Colors.blue, Colors.red]).createShader(
      Rect.fromLTWH(
        offset.dx,
        offset.dy,
        textPainter.width,
        textPainter.height,
      ),
    );
    final myTextPainter = TextPainter(
      text: TextSpan(
        text: "salom, Flutter",
        style: TextStyle(
          foreground: Paint()..shader = shader,
          fontSize: 24,
        ),
      ),
      textDirection: TextDirection.ltr
    );
    myTextPainter.layout(minWidth: 0, maxWidth: size.width);
    var offsetS = Offset(50, 200);
    myTextPainter.paint(canvas, offsetS);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
