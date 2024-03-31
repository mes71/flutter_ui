import 'dart:math';

import 'package:flutter/material.dart';

class NikeProductCard extends StatefulWidget {
  static String tag = "/NikeProductCardRoute";

  const NikeProductCard({super.key});

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

  final List<int> sizeList = [7, 8, 9, 10];
  final List<MaterialColor> colorsList = [
    Colors.green,
    Colors.red,
    Colors.amber
  ];

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 1.0, end: 1.4).animate(_controller);
    _shoseAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, -50))
            .animate(_controller);

    textAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131313),
      body: Center(
        child: Container(
          width: 500,
          height: 450,
          margin: const EdgeInsets.symmetric(horizontal: 16),
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
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        if (_controller.status == AnimationStatus.completed) {
                          _controller.reverse();
                        } else {
                          _controller.forward();
                        }
                      });
                    },
                    child: AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _animation.value,
                            filterQuality: FilterQuality.high,
                            child: Container(
                              width: 293,
                              height: targetSize,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1500),
                                  color: const Color(0xFF9bdc28)),
                            ),
                          );
                        }),
                  )),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if (_controller.status == AnimationStatus.completed) {
                      _controller.reverse();
                    } else {
                      _controller.forward();
                    }
                  });
                },
                child: AnimatedBuilder(
                  animation: _shoseAnimation,
                  builder: (context, child) => Transform.translate(
                    offset: _shoseAnimation.value,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Transform.rotate(
                              angle: -pi / 8,
                              child: Image.asset(
                                'assets/images/nikle_shoes.webp',
                              )),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Text(
                          "Nike Shoes",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                child: FadeTransition(
                  opacity: textAnimation,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Size : ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.white),
                          ),
                          const SizedBox(width: 25),
                          SizedBox(
                            width: 150,
                            height: 30,
                            child: ListView.separated(
                              itemCount: sizeList.length,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Container(
                                width: 30,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text(sizeList[index].toString()),
                                ),
                              ),
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(width: 8),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Colors : ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.white),
                          ),
                          const SizedBox(width: 25),
                          SizedBox(
                            width: 150,
                            height: 20,
                            child: ListView.separated(
                              itemCount: colorsList.length,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: colorsList[index],
                                  borderRadius: BorderRadius.circular(10),

                                ),
                              ),
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(
                                width: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Buy Now'),
                      )
                    ],
                  ),
                ),
              ),
            ],
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
