import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  static const String tag = "/TestPage";

  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
