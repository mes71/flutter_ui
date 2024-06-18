import 'package:flutter/material.dart';
import 'package:flutter_ui/screen/light_room/light_room_page.dart';
import 'package:flutter_ui/screen/screen.dart';
import 'package:google_fonts/google_fonts.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade400),
        useMaterial3: true,
      ),
      initialRoute: NikeProductCard.tag,
      routes: {
        NikeProductCard.tag: (context) => const NikeProductCard(),
        ProductCard01.tag: (context) => const ProductCard01(),
        LightRoomPage.tag: (context) => const LightRoomPage(),
        ProductCard02.tag : (context) => const ProductCard02(),

      },
    );
  }
}
