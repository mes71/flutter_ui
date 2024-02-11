import 'dart:math';

import 'package:flutter/material.dart';

class NikeProductCard extends StatefulWidget {
  const NikeProductCard({super.key});

  static String tag = "/NikeProductCardRoute";

  @override
  _NikeProductCardState createState() => _NikeProductCardState();
}

class _NikeProductCardState extends State<NikeProductCard>
    with SingleTickerProviderStateMixin {
  var sourceSize = 200.0;
  var targetSize = 270.0;
  var isSelected = false;

  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Offset> _shoseAnimation;
  late Animation<double> textAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 1.0, end: 1.4).animate(_controller);
    _shoseAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(-10, -50))
        .animate(_controller);

    textAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131313),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (_controller.status == AnimationStatus.completed) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
            });
          },
          child: Container(
            width: 320,
            height: 450,
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: -50,
                    right: -50,
                    child: AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _animation.value,
                            child: Container(
                              width: 293,
                              height: targetSize,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1500),
                                  color: const Color(0xFF9bdc28)),
                            ),
                          );
                        })),
                AnimatedBuilder(
                  animation: _shoseAnimation,
                  builder: (context, child) => Transform.translate(
                    offset: _shoseAnimation.value,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Transform.rotate(
                              angle: -pi / 8,
                              child: Image.asset(
                                'assets/images/nikle_shoes.webp',
                              )),
                        ),
                        SizedBox(height: 123,),
                        Text("Nike Shoes",style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),)
                      ],
                    ),
                  ),
                ),
                FadeTransition(
                  opacity: textAnimation,
                  child: Text(
                      'Hello World',
                      style: TextStyle(fontSize: 28.0)
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
