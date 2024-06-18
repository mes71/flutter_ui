import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/utils/logger.dart';

class AirPodShopPage extends StatefulWidget {
  const AirPodShopPage({super.key});

  static const String tag = "/AirPodShopPageRoute";

  @override
  State<AirPodShopPage> createState() => _AirPodShopPageState();
}

class _AirPodShopPageState extends State<AirPodShopPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (kIsWeb) {
          "isWeb".sLog;
        } else {
          "isOther".sLog;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
