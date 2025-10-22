import 'package:flutter/material.dart';

class MountainsPage extends StatefulWidget {
  const MountainsPage({super.key});

  @override
  State<MountainsPage> createState() => _MountainsPageState();
}

class _MountainsPageState extends State<MountainsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [],
      ),
    );
  }
}
