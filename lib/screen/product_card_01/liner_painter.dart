
import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  double horizontalAnimation;
  double verticalAnimation;

  LinePainter(this.horizontalAnimation, this.verticalAnimation);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      const Offset(0, 0),
      Offset(horizontalAnimation, 0),
      paint,
    ); // horizontal line
    canvas.drawLine(
      Offset(horizontalAnimation, 0),
      Offset(horizontalAnimation, verticalAnimation),
      paint,
    ); // vertical line
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}