import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/utils/utils.dart';

class AirPodShopPage extends StatefulWidget {
  const AirPodShopPage({super.key});

  static const String tag = "/AirPodShopPageRoute";

  @override
  State<AirPodShopPage> createState() => _AirPodShopPageState();
}

class _AirPodShopPageState extends State<AirPodShopPage> {
  bool isWeb = false;

  @override
  void initState() {
    super.initState();
    checkPlatform();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    checkPlatform();
  }

  void checkPlatform() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (kIsWeb) {
          isWeb = true;
        } else {
          isWeb = false;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isWeb ? phoneNotSupport() : phoneNotSupport(),
    );
  }

  // when run this page from application show this page
  Widget phoneNotSupport() => Container(
        color: Colors.grey.shade50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.imagesNoPhone.toPng(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "This page does not support any mobile devices.",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            )
          ],
        ),
      );
}
