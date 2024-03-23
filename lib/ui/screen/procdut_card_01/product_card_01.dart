import 'package:flutter/material.dart';
import 'package:flutter_ui/presentation/style/assets.dart';
import 'package:flutter_ui/ui/utils/color_convertor.dart';

class ProductCard01 extends StatefulWidget {
  const ProductCard01({super.key});

  static const String tag = "/ProductCard01Route";

  @override
  State<ProductCard01> createState() => _ProductCard01State();
}

class _ProductCard01State extends State<ProductCard01>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _horizontalAnimation;
  late Animation<double> _verticalAnimation;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _horizontalAnimation =
        Tween<double>(begin: 0, end: 250).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 0.5, curve: Curves.easeInOut),
    ))
          ..addListener(() {
            setState(() {});
          });

    _verticalAnimation =
        Tween<double>(begin: 0, end: 100).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
    ))
          ..addListener(() {
            setState(() {});
          });

    _textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexTolColor("#fce0df"),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: -78,
            left: 80,
            child: Center(
              child: CustomPaint(
                painter: LinePainter(
                    _horizontalAnimation.value, _verticalAnimation.value),
                child: const SizedBox(
                  width: 360, // Set width and height for the CustomPaint
                  height: 500,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  if (_controller.isCompleted) {
                    _controller.reverse();
                  } else {
                    _controller.forward();
                  }
                },
                child: Image.asset(Assets.imagesPorganic01, width: 150),
              ),
            ),
          ),
          Positioned(
            left: 142,
            child: FadeTransition(
              opacity: _textAnimation,
              child: const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "PORGANIC",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Organic pitaya blended \nwith sprouted chia, bananas\nand fresh fruit.",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

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
