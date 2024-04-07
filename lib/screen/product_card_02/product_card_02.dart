import 'dart:ui';

import 'package:flutter/material.dart';

class ProductCard02 extends StatefulWidget {
  const ProductCard02({super.key});

  static const String tag = "/ProductCard02Route";

  @override
  State<ProductCard02> createState() => _ProductCard02State();
}

class _ProductCard02State extends State<ProductCard02> {
  bool _isTaped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(47),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeInOut,
                top: _isTaped ? 30 : -30,
                right: _isTaped ? 40 : -40,
                child: Container(
                  width: 220,
                  height: 228,
                  decoration: const ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xFFC48AFF), Color(0xFF6322A3)],
                    ),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 10.0),
                child: Container(
                  width: 428,
                  height: 549,
                  decoration: ShapeDecoration(
                    color: const Color(0x7FD9D9D9),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 4, color: Color(0x659D6DDA)),
                      borderRadius: BorderRadius.circular(47),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 55, vertical: 130),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Lorem sit',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        const Text(
                          'Parturient',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 55.01,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _isTaped = !_isTaped;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFF4400),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.all(18),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                textStyle: const TextStyle(fontSize: 23)),
                            child: const Text("Press"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
