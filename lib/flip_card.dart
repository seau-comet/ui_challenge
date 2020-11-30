import 'dart:math';

import 'package:flutter/material.dart';

class FlipCard extends StatefulWidget {
  final String image;

  const FlipCard({Key key, this.image}) : super(key: key);
  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation = Tween(end: 1.0, begin: 0.7).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xFF382e63),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              child: Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: "movie",
                  child: Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.002)
                      ..rotateX(pi * _animation.value - 2.1),
                    child: GestureDetector(
                      onTap: () {
                        if (_animationStatus == AnimationStatus.dismissed) {
                          _animationController.forward();
                        } else {
                          _animationController.reverse();
                        }
                      },
                      child: Container(
                        child: Image.asset(
                          widget.image,
                          width: MediaQuery.of(context).size.width * .7,
                          height: 200,
                          color: Colors.white38,
                          colorBlendMode: BlendMode.overlay,
                          fit: BoxFit.cover,
                          // color: Color(0xFF42396e),
                        ),
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                spreadRadius: 30,
                                color: Color(0xFF423988),
                                blurRadius: 100.0,
                                offset: Offset(0.0, 200))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
