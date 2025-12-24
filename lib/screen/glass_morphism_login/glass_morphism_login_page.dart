import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/gen/assets.gen.dart';
import 'package:flutter_ui/utils/context_utils.dart';

class GlassMorphismLoginPage extends StatefulWidget {
  const GlassMorphismLoginPage({super.key});

  static const String tag = "/GlassMorphismLoginPage";

  @override
  State<GlassMorphismLoginPage> createState() => _GlassMorphismLoginPageState();
}

class _GlassMorphismLoginPageState extends State<GlassMorphismLoginPage> {
  bool _isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.cityDigitalArt.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          // Optional: Adds rounded corners
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              width: context.getWidth * 0.45,
              height: context.getWidth * 0.43,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1.5,
                  color: Colors.white.withValues(alpha: 0.2),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: context.getHeight * 0.05,
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: context.getHeight * 0.05,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.getHeight * 0.05,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.getHeight * 0.05,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: context.getWidth * 0.02,
                      ),
                      Checkbox(
                        value: _isRememberMe,
                        onChanged: (value) {
                          setState(() {
                            _isRememberMe = value!;
                          });
                        },
                        fillColor: WidgetStateProperty.all(Colors.white),
                        checkColor: Colors.black,
                        side: const BorderSide(color: Colors.transparent),
                      ),
                      const Text('Remember me',
                          style: TextStyle(color: Colors.black)),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                        ),
                        child: const Text('Reset password',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            )),
                      ),
                      SizedBox(
                        width: context.getWidth * 0.02,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.getWidth * 0.05,
                  ),
                  Container(
                    width: double.infinity,
                    height: 56,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: Colors.white), // White border
                        ), // Transparent background
                      ).copyWith(
                        backgroundColor:
                            WidgetStateProperty.resolveWith<Color?>(
                          (Set<WidgetState> states) {
                            if (states.contains(WidgetState.hovered)) {
                              return Colors.transparent;
                            }
                            return Colors.white;
                          },
                        ),
                      ),
                      child: const Text('Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: context.getWidth * 0.05,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
