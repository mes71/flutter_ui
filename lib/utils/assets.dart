// Extension `AssetsHandler` on `String` provides utility methods to generate asset paths
extension AssetsHandler on String {

  // Generates an SVG asset path based on the string receiver
  String toSvg() => 'assets/icons/$this.svg';

  // Generates a WebP image asset path based on the string receiver
  String toWebp() => 'assets/images/$this.webp';

  // Generates a PNG image asset path based on the string receiver
  String toPng() => 'assets/images/$this.png';
}
