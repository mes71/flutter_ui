import 'package:flutter/material.dart';

class RealEstatePage extends StatefulWidget {
  const RealEstatePage({super.key});

  static const String tag = '/RealEstatePageRoute';

  @override
  State<RealEstatePage> createState() => _RealEstatePageState();
}

class _RealEstatePageState extends State<RealEstatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [
            Color(0xFFEAEBED),
            Colors.white.withValues(alpha: 0.9),
            Color(0x93EAEBED)
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Stack(
        children: [],
      ),
    ));
  }
}
