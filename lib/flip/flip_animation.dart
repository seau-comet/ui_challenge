import 'package:flutter/material.dart';
import 'package:movie_theater/flip/flip_trek.dart';

class FlipAnimation extends StatefulWidget {
  final String image;

  const FlipAnimation({Key key, this.image}) : super(key: key);
  @override
  _FlipAnimationState createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3500),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlipTrekking(
      controller: _controller,
      image: widget.image,
    );
  }
}
