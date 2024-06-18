import 'package:flutter/material.dart';
import 'package:flutter_ui/screen/product_card_01/liner_painter.dart';
import 'package:flutter_ui/utils/assets.dart';
import 'package:flutter_ui/utils/color_convertor.dart';

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
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    _horizontalAnimation =
        Tween<double>(begin: 0, end: 250).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 0.5, curve: Curves.easeInOut),
    ));

    _verticalAnimation =
        Tween<double>(begin: 0, end: 100).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
    ));

    _textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    _scaleAnimation = Tween<double>(
      begin: 2,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-1.5, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _handleTap() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexTolColor("#fce0df"),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: -70,
            left: 80,
            child: Center(
              child: Visibility(
                visible: _horizontalAnimation.value != 0,
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
          ),
          Positioned(
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: _handleTap,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Align(
                          alignment: Alignment(_slideAnimation.value.dx, 0),
                          child: Assets.imagesPorganic01.toPng(
                            width: 210,
                            height: 210,
                          )),
                    );
                  },
                ),
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
