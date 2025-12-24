import 'package:flutter/material.dart';
import 'package:flutter_ui/gen/assets.gen.dart';

class LightRoomPage extends StatefulWidget {
  const LightRoomPage({super.key});

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
                      : Colors.black.withValues(alpha: 0.7),
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
            child: Assets.images.lamp.image(
              width: 199,
              height: 327,
            )),
        Positioned(
          top: 285,
          right: 95,
          child: FadeTransition(
              opacity: _fadeAnimation, child: Assets.icons.light.svg()),
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
                  ? const WidgetStatePropertyAll<Color>(Color(0xFFA9BDB2))
                  : const WidgetStatePropertyAll<Color>(
                      Color.fromRGBO(193, 193, 193, 0.5)),
              activeThumbColor: const Color(0xFF335B42),
              activeThumbImage: Assets.images.switchOn.provider(),
              inactiveThumbImage: Assets.images.switchOff.provider(),
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
                    Assets.icons.light1.svg(),
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
                    Assets.icons.light2.svg(),
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
