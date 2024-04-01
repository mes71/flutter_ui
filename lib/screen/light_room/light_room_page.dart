import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/utils/assets.dart';

class LightRoomPage extends StatefulWidget {
  const LightRoomPage({super.key});

  static const String tag = "/LightRoomPageRoute";

  @override
  State<LightRoomPage> createState() => _LightRoomPageState();
}

class _LightRoomPageState extends State<LightRoomPage>
    with TickerProviderStateMixin {
  bool lightIsOn = false;
  double intensity = 0.5;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 700),
    vsync: this,
  );
  late final Animation<double> _fadeAnimation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);

    if (lightIsOn) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF314539),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Positioned(
                      top: 165,
                      right: 10,
                      child: Container(
                        width: 282,
                        height: 282,
                        decoration: lightIsOn?ShapeDecoration(
                            shape: const OvalBorder(),
                            shadows: [
                              BoxShadow(
                                color: Color.fromRGBO(245, 245, 221, intensity),
                                blurRadius: 150,
                                blurStyle: BlurStyle.normal,
                                offset: Offset(10,-10)


                              )
                            ],

                        ):ShapeDecoration(
                          shape: OvalBorder(),
                          shadows: [
                            BoxShadow(
                                color:Colors.black.withOpacity(0.35),
                                blurRadius: 150,
                                blurStyle: BlurStyle.normal,
                                offset: Offset(10,-10)


                            )
                          ],
                        ),
                      )),
                  Positioned(
                    top: 0,
                    right: 37,
                    child: Image.asset(
                      Assets.imagesLamp,
                      width: 199,
                      height: 327,
                    ),
                  ),
                  Positioned(
                    top: 285,
                    right: 95,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: SvgPicture.asset(
                        Assets.iconsLight,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Island Kitchen Bar \nLED Pendant Ceiling Light',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Switch(
                        value: lightIsOn,
                        onChanged: (value) {
                          setState(() {
                            lightIsOn = !lightIsOn;
                          });
                        },
                        trackColor: lightIsOn
                            ? const MaterialStatePropertyAll<Color>(
                                Color(0xFFA9BDB2))
                            : const MaterialStatePropertyAll<Color>(
                                Color.fromRGBO(193, 193, 193, 0.5)),
                        activeColor: const Color(0xFF335B42),
                        activeThumbImage:
                            const AssetImage(Assets.imagesSwitchOn),
                        inactiveThumbImage:
                            const AssetImage(Assets.imagesSwitchOff),
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.white,
                      ),
                    ),
                    const Row(),
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 100),
                            child: Text(
                              'Light Intensity',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(Assets.iconsLight1),
                              Expanded(
                                child: Slider(
                                  value: intensity,
                                  activeColor: Colors.white,
                                  onChanged: (value) {
                                    setState(() {
                                      intensity = value;
                                    });
                                  },
                                  inactiveColor: const Color(0xFF335B42),
                                ),
                              ),
                              SvgPicture.asset(Assets.iconsLight2),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
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
