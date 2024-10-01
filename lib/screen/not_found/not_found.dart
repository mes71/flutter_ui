import 'package:flutter/material.dart';
import 'package:flutter_ui/screen/not_found/nosie_painter.dart';
import 'package:flutter_ui/utils/utils.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});

  static const String tag = '/NotFoundPage';

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Offset> _noisePositions = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 100), // Adjust animation duration
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.white,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: NoisePainter(
                    noisePositions: _noisePositions,
                    animationProgress: _controller.value,
                  ),
                  size: Size.infinite,
                );
              },
            ),
          ),
          Image.asset(
            Assets.imagesNotFound,
            width: 300,
            height: 300,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
