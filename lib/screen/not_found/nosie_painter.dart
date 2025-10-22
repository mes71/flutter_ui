import 'dart:math';

import 'package:flutter/material.dart';

class NoisePainter extends CustomPainter {
  final List<Offset> noisePositions;
  final double animationProgress;

  NoisePainter({
    required this.noisePositions,
    required this.animationProgress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const gridSpacing = 5;
    final noisePaint = Paint()
      ..color =
          [Colors.black.withOpacity(.7), Colors.white][Random().nextInt(2)];
    for (double x = 0; x <= size.width; x += gridSpacing) {
      for (double y = 0; y <= size.height; y += gridSpacing) {
        canvas.drawCircle(
            Offset(x, y), (Random().nextInt(12).toDouble()), noisePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
