import 'package:flutter/material.dart';
import 'package:flutter_ui/utils/utils.dart';

SizedBox appBar() {
  return SizedBox(
      height: 80,
      child: Row(
        children: [
          Assets.imagesAppleLogo.toPng(),
          const Text(
            'AirPods Max',
            style: TextStyle(
              color: Color(0xFF323232),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Overview',
                      style: TextStyle(
                        color: Color(0xFF323232),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Tech Specs',
                      style: TextStyle(
                        color: Color(0xFF323232),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Compare',
                      style: TextStyle(
                        color: Color(0xFF323232),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ));
}
