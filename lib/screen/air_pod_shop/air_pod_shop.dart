import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/utils/utils.dart';

import 'app_bar.dart';

class AirPodShopPage extends StatefulWidget {
  const AirPodShopPage({super.key});

  static const tag = "/AirPodShopPageRoute";

  @override
  State<AirPodShopPage> createState() => _AirPodShopPageState();
}

class _AirPodShopPageState extends State<AirPodShopPage>
    with SingleTickerProviderStateMixin {
  bool isWeb = false;
  int selectedAirPod = 1;
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _translationAnimation;
  late Animation<double> _fadeAnimation;
  final TransformationController _transformationController = TransformationController();
  @override
  void initState() {
    super.initState();
    checkPlatform();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )
      ..forward()
      ..repeat(reverse: true);

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: -3.141592653589793, // 180 degrees in radians counterclockwise
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _translationAnimation = Tween<double>(
      begin: 0,
      end: 1000, // Move 200 pixels down
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));


    _controller.addListener(() {
      final scaleValue = 1.0 - 0.5 * _rotationAnimation.value;
      final rotationValue = _rotationAnimation.value * 2 * 3.141592653589793;
      _transformationController.value = Matrix4.identity()
        ..scale(scaleValue)
        ..rotateZ(rotationValue);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    checkPlatform();
  }

  void checkPlatform() async {
    if (kIsWeb) {
      isWeb = true;
    } else {
      isWeb = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    isWeb.sLog;
    return Scaffold(
      body: isWeb ? webPage() : phoneNotSupport(),
    );
  }

  // when run this page from application show this page
  Widget phoneNotSupport() => Container(
        color: Colors.grey.shade50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.imagesNoPhone.toPng(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "This page does not support any mobile devices.",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            )
          ],
        ),
      );

  Widget webPage() => Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.2, 0.32, 0.57, 0.91, 0.92, 1],
            colors: [
              Color(0xFFCFCFCF),
              Color(0xFFD0D0D0),
              Color(0xFFFCFCFC),
              Color(0xFFFCFCFC),
              Color(0xFFFCFCFC),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            appBar(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Divider(
                height: 5,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  /*             Positioned(
                      left: 50,
                      top: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'AirPods Max',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 150,
                                fontWeight: FontWeight.w900,
                                shadows: [
                                  Shadow(
                                      color: Color(0xFFD0D0D0),
                                      offset: Offset(4, 1),
                                      blurRadius: 10)
                                ]),
                          ),
                          const Text(
                            'Apple AirPods Max Wireless\nOver-Ear Headphones',
                            style: TextStyle(
                              color: Color(0xFF323232),
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 56),
                          ColorCirclesWidget(
                            selectedIndex: selectedAirPod,
                            onTap: (index) {
                              setState(() {
                                selectedAirPod = index;
                              });
                            },
                          ),
                          const SizedBox(height: 50),
                          productDetails(
                              title: 'Model Name:', description: 'AirPods Max'),
                          productDetails(
                              title: 'Color:',
                              description:
                                  'Space Gray, Green,\n Pink, Silver, Sky Blue'),
                          productDetails(
                              title: 'Form Factor:', description: 'Over Ear'),
                          productDetails(
                              title: 'Connectivity\nTechnology:',
                              description: 'Wireless, Wired'),
                        ],
                      )),*/
                  Positioned(
                      right: -100,
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(0, _translationAnimation.value),
                            child: Transform(
                              transform:  _transformationController.value,
                              child: Opacity(
                                opacity: _fadeAnimation.value,
                                child: Assets.imagesAirPodBlack
                                    .toPng(width: 900, height: 900),
                              ),
                            ),
                          );
                        },
                      )),
                ],
              ),
            ),
          ],
        ),
      ));
}
