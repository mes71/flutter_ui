import 'package:flutter/material.dart';
import 'package:flutter_ui/utils/logger.dart';

class TestPage extends StatefulWidget {
  static const String tag = "/TestPage";

  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage>
    with SingleTickerProviderStateMixin {
  var dx = 0;
  var dy = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Test Page"),
        ),
        body: Stack(
          alignment: AlignmentGeometry.center,
          children: [
            AnimatedPositioned.fromRect(
                rect: Rect.fromLTWH(
                  dx.toDouble(),
                  dy.toDouble(),
                  250,
                  100,
                ),
                duration: Duration(milliseconds: 5),
                child: GestureDetector(
                    onPanUpdate: (details) {
                      setState(() {
                        dx += details.delta.dx.toInt();
                        dy += details.delta.dy.toInt();
                      });
                    },
                    child: Container(
                      width: 250,
                      height: 100,
                      color: Colors.deepOrange,
                    )))
          ],
        ));
  }
}

class SwipeableCards extends StatefulWidget {
  const SwipeableCards({super.key});

  @override
  State<SwipeableCards> createState() => _SwipeableCardsState();
}

class _SwipeableCardsState extends State<SwipeableCards> {
  List<int> cardOrder = [0, 1, 2];

  List<LinearGradient> color = [
    const LinearGradient(
      colors: [Color(0xffFF512F), Color(0xffDD2476)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    const LinearGradient(
      colors: [
        Color(0xff1488CC),
        Color(0xff2B32B2),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    const LinearGradient(
      colors: [Color(0xffad5389), Color(0xff3c1053)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ];

  void changeCardOrder(int sCard, int index) {
    setState(() {
      LinearGradient materialAccentColor = color[index];
      cardOrder.remove(sCard);
      color.remove(color[index]);
      color.insert(0, materialAccentColor);
      cardOrder.insert(0, sCard);
    });
  }

  @override
  void initState() {
    super.initState();
    cardOrder = cardOrder.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Stack(
          children: [
            for (int i = 0; i < cardOrder.length; i++)
              SCard(
                color: color[i],
                index: i,
                key: ValueKey(cardOrder[i]),
                value: cardOrder[i],
                onDragged: () => changeCardOrder(cardOrder[i], i),
              )
          ],
        ),
      ),
    );
  }
}

class SCard extends StatefulWidget {
  final int index;
  final int value;
  final Function onDragged;
  final LinearGradient color;
  const SCard(
      {super.key,
      required this.index,
      required this.onDragged,
      required this.value,
      required this.color});

  @override
  State<SCard> createState() => _SCardState();
}

class _SCardState extends State<SCard> with TickerProviderStateMixin {
  Offset _position = const Offset(0, 0);
  double height = 200;
  double width = 300;

  Curve _myCurve = Curves.linear;
  Duration _duration = const Duration(milliseconds: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: ((MediaQuery.of(context).size.width / 2) - (width / 2)) +
          _position.dx,
      top: ((MediaQuery.of(context).size.height / 2) -
              (height / 2) +
              (widget.index * 20)) +
          _position.dy,
      duration: _duration,
      curve: _myCurve,
      child: GestureDetector(
        onPanUpdate: (details) {
          if (widget.index == 2) {
            _myCurve = Curves.linear;
            _duration = const Duration(milliseconds: 0);
            if (width >= 100 || height >= 100) {
              width -= 4;
              height -= 1;
            }

            _position += details.delta;
            setState(() {});
          }
        },
        onPanEnd: (details) {
          if (widget.index == 2) {
            _myCurve = Curves.easeIn;
            _duration = const Duration(milliseconds: 300);
            setState(() {
              if (_position.dx <= -(width / 2) || _position.dx >= (width / 2)) {
                // If so, move the card to the back (0th index)
                widget.onDragged();

                _position = Offset.zero;
              } else {
                _position = Offset.zero;
              }
              width = 300;
              height = 200;
            });
          }
        },
        child: AnimatedContainer(
          width: width,
          height: height,
          duration: const Duration(milliseconds: 200),
          child: Container(
            decoration: BoxDecoration(
                gradient: widget.color,
                borderRadius: BorderRadius.circular(20)),
            child: Center(child: Text("Item ${widget.value}")),
          ),
        ),
      ),
    );
  }

  void _animateCardBack() {
    // _animationController.forward();
  }

  @override
  void dispose() {
    // _animationController.dispose();
    super.dispose();
  }
}
