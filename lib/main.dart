import 'package:flutter/material.dart';
import 'package:flutter_ui/ui/screen/nike_product_card/nike_product_card.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/screen/my_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI',
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade400),
        useMaterial3: true,
      ),
      initialRoute: NikeProductCard.tag,
      routes: {
        NikeProductCard.tag: (context) => const NikeProductCard(),
        MyApps.tag :(context) => MyApps()
      },
    );
  }
}
