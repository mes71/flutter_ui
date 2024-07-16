import 'package:flutter/material.dart';

class ColorCirclesWidget extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index) onTap;

  final List<Color> topColors = [
    const Color(0xFF3C3D3A),
    const Color(0xFFAFBFAB),
    const Color(0xFFE4544D),
    const Color(0xFFF5F4F0),
    const Color(0xFF30506C),
  ];
  final List<Color> bottomColors = [
    const Color(0xFF595759),
    const Color(0xFFE7ECE3),
    const Color(0xFFD8A097),
    const Color(0xFFD2D3D4),
    const Color(0xFF91A6BB),
  ];

  ColorCirclesWidget(
      {super.key, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(topColors.length, (index) {
        return GestureDetector(
          onTap: () => onTap(index),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleWidget(
              topColor: topColors[index],
              bottomColor: bottomColors[index],
              isSelected: index == selectedIndex,
            ),
          ),
        );
      }),
    );
  }
}

class CircleWidget extends StatelessWidget {
  final Color topColor;
  final Color bottomColor;
  final bool isSelected;

  const CircleWidget({
    super.key,
    required this.topColor,
    required this.bottomColor,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        border: isSelected ? Border.all(color: Colors.black, width: 2) : null,
      ),
      child: ClipOval(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 70,
              height: 35,
              color: topColor,
            ),
            Container(
              width: 70,
              height: 35,
              color: bottomColor,
            ),
          ],
        ),
      ),
    );
  }
}
