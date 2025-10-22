// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/light.svg
  SvgGenImage get light => const SvgGenImage('assets/icons/light.svg');

  /// File path: assets/icons/light1.svg
  SvgGenImage get light1 => const SvgGenImage('assets/icons/light1.svg');

  /// File path: assets/icons/light2.svg
  SvgGenImage get light2 => const SvgGenImage('assets/icons/light2.svg');

  /// List of all assets
  List<SvgGenImage> get values => [light, light1, light2];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/air_pod_black.png
  AssetGenImage get airPodBlack =>
      const AssetGenImage('assets/images/air_pod_black.png');

  /// File path: assets/images/air_pod_blue.png
  AssetGenImage get airPodBlue =>
      const AssetGenImage('assets/images/air_pod_blue.png');

  /// File path: assets/images/air_pod_green.png
  AssetGenImage get airPodGreen =>
      const AssetGenImage('assets/images/air_pod_green.png');

  /// File path: assets/images/air_pod_red.png
  AssetGenImage get airPodRed =>
      const AssetGenImage('assets/images/air_pod_red.png');

  /// File path: assets/images/air_pod_white.png
  AssetGenImage get airPodWhite =>
      const AssetGenImage('assets/images/air_pod_white.png');

  /// File path: assets/images/apple_logo.png
  AssetGenImage get appleLogo =>
      const AssetGenImage('assets/images/apple_logo.png');

  /// File path: assets/images/city_digital_art.jpg
  AssetGenImage get cityDigitalArt =>
      const AssetGenImage('assets/images/city_digital_art.jpg');

  /// File path: assets/images/hand_drawn_404_error.png
  AssetGenImage get handDrawn404Error =>
      const AssetGenImage('assets/images/hand_drawn_404_error.png');

  /// File path: assets/images/lamp.png
  AssetGenImage get lamp => const AssetGenImage('assets/images/lamp.png');

  /// File path: assets/images/nikle_shoes.webp
  AssetGenImage get nikleShoes =>
      const AssetGenImage('assets/images/nikle_shoes.webp');

  /// File path: assets/images/no_phone.png
  AssetGenImage get noPhone =>
      const AssetGenImage('assets/images/no_phone.png');

  /// File path: assets/images/not_found.png
  AssetGenImage get notFound =>
      const AssetGenImage('assets/images/not_found.png');

  /// File path: assets/images/porganic.png
  AssetGenImage get porganic =>
      const AssetGenImage('assets/images/porganic.png');

  /// File path: assets/images/porganic01.png
  AssetGenImage get porganic01 =>
      const AssetGenImage('assets/images/porganic01.png');

  /// File path: assets/images/switch_off.png
  AssetGenImage get switchOff =>
      const AssetGenImage('assets/images/switch_off.png');

  /// File path: assets/images/switch_on.png
  AssetGenImage get switchOn =>
      const AssetGenImage('assets/images/switch_on.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        airPodBlack,
        airPodBlue,
        airPodGreen,
        airPodRed,
        airPodWhite,
        appleLogo,
        cityDigitalArt,
        handDrawn404Error,
        lamp,
        nikleShoes,
        noPhone,
        notFound,
        porganic,
        porganic01,
        switchOff,
        switchOn
      ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/cloud.svg
  SvgGenImage get cloud => const SvgGenImage('assets/svg/cloud.svg');

  /// File path: assets/svg/moon.svg
  SvgGenImage get moon => const SvgGenImage('assets/svg/moon.svg');

  /// File path: assets/svg/mountains.svg
  SvgGenImage get mountains => const SvgGenImage('assets/svg/mountains.svg');

  /// List of all assets
  List<SvgGenImage> get values => [cloud, moon, mountains];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
