import 'package:flutter/material.dart';

MaterialColor hexToMaterialColor(String hexColor) {
  // Remove the '#' character from the beginning of the hex color
  hexColor = hexColor.replaceAll('#', '');

  // Parse the hex color string to get the individual color values
  int hexValue = int.parse(hexColor, radix: 16);

  // Extract the individual color components
  int alpha = (hexValue >> 24) & 0xFF;
  int red = (hexValue >> 16) & 0xFF;
  int green = (hexValue >> 8) & 0xFF;
  int blue = hexValue & 0xFF;

  // Create a MaterialColor object
  return MaterialColor(
    hexValue,
    <int, Color>{
      50: Color.fromRGBO(red, green, blue, 0.1),
      100: Color.fromRGBO(red, green, blue, 0.2),
      200: Color.fromRGBO(red, green, blue, 0.3),
      300: Color.fromRGBO(red, green, blue, 0.4),
      400: Color.fromRGBO(red, green, blue, 0.5),
      500: Color.fromRGBO(red, green, blue, 0.6),
      600: Color.fromRGBO(red, green, blue, 0.7),
      700: Color.fromRGBO(red, green, blue, 0.8),
      800: Color.fromRGBO(red, green, blue, 0.9),
      900: Color.fromRGBO(red, green, blue, 1.0),
    },
  );
}

Color hexTolColor(String hexColor) {
  var materialColor = hexToMaterialColor(hexColor);

  return materialColor.shade900;
}
