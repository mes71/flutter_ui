// Extension `AssetsHandler` on `String` provides utility methods for generating asset widgets and image providers
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Assets {
  Assets._();

  static const String iconsLight = 'assets/icons/light.svg';
  static const String iconsLight1 = 'assets/icons/light1.svg';
  static const String iconsLight2 = 'assets/icons/light2.svg';
  static const String imagesAirPodBlack = 'assets/images/air_pod_black.png';
  static const String imagesAppleLogo = 'assets/images/apple_logo.png';
  static const String imagesAirPodBlue = 'assets/images/air_pod_blue.png';
  static const String imagesAirPodGreen = 'assets/images/air_pod_green.png';
  static const String imagesAirPodRed = 'assets/images/air_pod_red.png';
  static const String imagesAirPodWhite = 'assets/images/air_pod_white.png';
  static const String imagesLamp = 'assets/images/lamp.png';
  static const String imagesNikleShoes = 'assets/images/nikle_shoes.webp';
  static const String imagesNoPhone = 'assets/images/no_phone.png';
  static const String imagesPorganic = 'assets/images/porganic.png';
  static const String imagesPorganic01 = 'assets/images/porganic01.png';
  static const String imagesSwitchOff = 'assets/images/switch_off.png';
  static const String imagesSwitchOn = 'assets/images/switch_on.png';
  static const String imagesNotFound = 'assets/images/hand_drawn_404_error.png';
  static const String imagesNotFound2 = 'assets/images/not_found.png';
  static const String imagesCityDigitalArt =
      'assets/images/city_digital_art.jpg';
}

extension AssetsHandler on String {
  // Generates an `SvgPicture` widget for the SVG asset with optional height and width
  SvgPicture toSvg({double? height, double? width}) =>
      SvgPicture.asset(this, width: width, height: height);

  // Generates an `Image` widget for the WebP image asset with optional height and width
  Image toWebp({double? height, double? width}) =>
      Image.asset(this, width: width, height: height);

  // Generates an `Image` widget for the PNG image asset with optional height and width
  Image toPng({double? height, double? width}) =>
      Image.asset(this, width: width, height: height);

  Image toJpg({double? height, double? width}) =>
      Image.asset(this, width: width, height: height);

  // Returns an `ImageProvider` for the PNG image asset without specifying height and width
  ImageProvider toPngImageProvider({double? height, double? width}) =>
      AssetImage(this);
}
