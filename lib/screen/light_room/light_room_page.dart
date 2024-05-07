import 'package:flutter/material.dart';
import 'package:flutter_ui/utils/assets.dart';

class LightRoomPage extends StatefulWidget {
  const LightRoomPage({Key? key}) : super(key: key);

  static const String tag = "/LightRoomPageRoute";

  @override
  State<LightRoomPage> createState() => _LightRoomPageState();
}

class _LightRoomPageState extends State<LightRoomPage>
    with TickerProviderStateMixin {
  // State variables
  bool lightIsOn = false;
  double intensity = 0.5;

  // Animation controller for fade animation
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 700),
    vsync: this,
  );

  // Curved animation for fading in/out
  late final Animation<double> _fadeAnimation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
              child: _buildLightSection(),
            ),
            Expanded(
              flex: 2,
              child: _buildControlSection(),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for the light display section
  Widget _buildLightSection() {
    return Stack(
      children: [
        Positioned(
          top: 165,
          right: 10,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: lightIsOn
                      ? Color.fromRGBO(245, 245, 221, intensity)
                      : Colors.black.withOpacity(0.7),
                  blurRadius: lightIsOn ? 151 : 150,
                  spreadRadius: lightIsOn ? 50 : 80,
                  blurStyle: BlurStyle.normal,
                  offset: const Offset(10, -10),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 0,
            right: 37,
            child: 'lamp'.toPng(
              width: 199,
              height: 327,
            )),
        Positioned(
          top: 285,
          right: 95,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: 'light'.toSvg(),
          ),
        ),
      ],
    );
  }

  // Widget for the control section
  Widget _buildControlSection() {
    return Padding(
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
              fontWeight: FontWeight.w300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Switch(
              value: lightIsOn,
              onChanged: (value) {
                setState(() {
                  lightIsOn = value;
                  lightIsOn ? _controller.forward() : _controller.reverse();
                });
              },
              trackColor: lightIsOn
                  ? const MaterialStatePropertyAll<Color>(Color(0xFFA9BDB2))
                  : const MaterialStatePropertyAll<Color>(
                      Color.fromRGBO(193, 193, 193, 0.5)),
              activeColor: const Color(0xFF335B42),
              activeThumbImage: 'switch_on'.toPngImageProvider(),
              inactiveThumbImage: 'switch_off'.toPngImageProvider(),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Light Intensity',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Row(
                  children: [
                    'light1'.toSvg(),
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
                    'light2'.toSvg(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
