// Extension `AssetsHandler` on `String` provides utility methods for generating asset widgets and image providers
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension AssetsHandler on String {
  // Generates an `SvgPicture` widget for the SVG asset with optional height and width
  SvgPicture toSvg({double? height, double? width}) =>
      SvgPicture.asset('assets/icons/$this.svg', width: width, height: height);

  // Generates an `Image` widget for the WebP image asset with optional height and width
  Image toWebp({double? height, double? width}) =>
      Image.asset('assets/images/$this.webp', width: width, height: height);

  // Generates an `Image` widget for the PNG image asset with optional height and width
  Image toPng({double? height, double? width}) =>
      Image.asset('assets/images/$this.png', width: width, height: height);

  // Returns an `ImageProvider` for the PNG image asset without specifying height and width
  ImageProvider toPngImageProvider({double? height, double? width}) =>
      AssetImage('assets/images/$this.png');
}
