import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  static const String tag = "/TestPage";

  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage>
    with SingleTickerProviderStateMixin {
  late ui.FragmentProgram _fragmentProgram;
  late ui.FragmentShader _shader;
  late AnimationController _controller;
  Offset _mousePosition = Offset.zero;
  double _scale = 0.2;
  double _blueRatio = 0.5;
  double _redness = 0.25;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
    _loadShader();
  }

  Future<void> _loadShader() async {
    _fragmentProgram =
        await ui.FragmentProgram.fromAsset('assets/shaders/frag.glsl');
    _shader = _fragmentProgram.fragmentShader();
  }

  @override
  void dispose() {
    _controller.dispose();
    _shader.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            _mousePosition = details.localPosition;
          });
        },
        child: CustomPaint(
          painter: EyePatternPainter(_shader, _controller, _mousePosition,
              _scale, _blueRatio, _redness),
          size: Size.infinite,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: Slider(
                value: _scale,
                onChanged: (value) {
                  setState(() {
                    _scale = value;
                  });
                },
                min: 0.05,
                max: 0.6,
              ),
            ),
            Expanded(
              child: Slider(
                value: _blueRatio,
                onChanged: (value) {
                  setState(() {
                    _blueRatio = value;
                  });
                },
                min: 0,
                max: 1,
              ),
            ),
            Expanded(
              child: Slider(
                value: _redness,
                onChanged: (value) {
                  setState(() {
                    _redness = value;
                  });
                },
                min: 0,
                max: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EyePatternPainter extends CustomPainter {
  final ui.FragmentShader _shader;
  final AnimationController _controller;
  final Offset _mousePosition;
  final double _scale;
  final double _blueRatio;
  final double _redness;

  EyePatternPainter(
    this._shader,
    this._controller,
    this._mousePosition,
    this._scale,
    this._blueRatio,
    this._redness,
  ) : super(repaint: _controller);

  @override
  void paint(Canvas canvas, Size size) async {
    _shader.setFloat(0, _controller.value);
    _shader.setFloat(1, size.width / size.height);
    _shader.setFloat(2, _mousePosition.dx / size.width);
    _shader.setFloat(3, 1 - _mousePosition.dy / size.height);
    _shader.setFloat(4, _scale);
    _shader.setFloat(5, _blueRatio);
    _shader.setFloat(6, _redness);

    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas shaderCanvas =
        Canvas(recorder, Rect.fromLTWH(0, 0, size.width, size.height));

    Paint paint = Paint()..shader = _shader;
    shaderCanvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    ui.Picture picture = recorder.endRecording();
    ui.Image image =
        await picture.toImage(size.width.toInt(), size.height.toInt());

    canvas.drawImage(image, Offset.zero, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is! EyePatternPainter ||
        oldDelegate._controller != _controller ||
        oldDelegate._mousePosition != _mousePosition ||
        oldDelegate._scale != _scale ||
        oldDelegate._blueRatio != _blueRatio ||
        oldDelegate._redness != _redness;
  }
}
