import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/utils/utils.dart';

import 'app_bar.dart';
import 'color_circle_widget.dart';
import 'product_details.dart';

class AirPodShopPage extends StatefulWidget {
  const AirPodShopPage({super.key});

  static const tag = "/AirPodShopPageRoute";

  @override
  State<AirPodShopPage> createState() => _AirPodShopPageState();
}

class _AirPodShopPageState extends State<AirPodShopPage>
    with SingleTickerProviderStateMixin {
  bool isWeb = false;
  int currentAirPod = 0;
  int oldAirPod = 0;
  List<String> airPodList = [
    Assets.imagesAirPodBlack,
    Assets.imagesAirPodGreen,
    Assets.imagesAirPodRed,
    Assets.imagesAirPodWhite,
    Assets.imagesAirPodBlue,
  ];

  late AnimationController _controller;
  late Animation<double> _rotateAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _positionAnimation;

  @override
  void initState() {
    super.initState();
    checkPlatform();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );

    _rotateAnimation = Tween<double>(begin: 0, end: -3).animate(_controller)
      ..addListener(
        () {
          setState(() {});
        },
      );
    _scaleAnimation = Tween<double>(begin: 1, end: 0.1).animate(_controller);
    _opacityAnimation = Tween<double>(begin: 1, end: 0).animate(_controller);
    _positionAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0.2, 1))
            .animate(_controller);
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
                  Positioned(
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
                            selectedIndex: currentAirPod,
                            onTap: onTapCircle,
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
                      )),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Opacity(
                      opacity: _controller.value,
                      child: Container(
                        child: airPodList[currentAirPod]
                            .toPng(width: 900, height: 900),
                      ),
                    ),
                  ),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      _controller.value.eLog;
                      return Positioned(
                        top: _positionAnimation.value.dy *
                            MediaQuery.of(context).size.height,
                        right: _positionAnimation.value.dx *
                            MediaQuery.of(context).size.width,
                        child: Transform.rotate(
                          angle: _rotateAnimation.value,
                          child: Transform.scale(
                            scale: _scaleAnimation.value,
                            child: Opacity(
                              opacity: _opacityAnimation.value,
                              child: Container(
                                child: airPodList[oldAirPod]
                                    .toPng(width: 900, height: 900),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ));

  void onTapCircle(int index) {
    setState(() {
      oldAirPod = currentAirPod;
      currentAirPod = index;
    });
    if (_controller.isCompleted) {
      _controller.reset();
    }
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
