import 'package:flutter/material.dart';

class FlipTrekkingEnterAnimation {
  FlipTrekkingEnterAnimation(this.controller)
      : barHeight = Tween<double>(begin: 0.7, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0, 0.2, curve: Curves.easeIn),
          ),
        ),
        meanAnimation = Tween(begin: Offset(1, 0), end: Offset(0, 0)).animate(
            CurvedAnimation(
                curve: Interval(0.3, 0.6, curve: Curves.elasticOut),
                parent: controller)),
        avatarSize = Tween<double>(begin: 0, end: 0.9).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.3, 0.6, curve: Curves.elasticOut),
          ),
        ),
        titleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.6, 0.65, curve: Curves.easeIn),
          ),
        ),
        textOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.65, 0.8, curve: Curves.easeIn),
          ),
        ),
        imageOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.8, 0.99, curve: Curves.easeIn),
          ),
        );

  final AnimationController controller;
  final Animation<double> barHeight;
  final Animation<double> avatarSize;
  final Animation<double> titleOpacity;
  final Animation<double> textOpacity;
  final Animation<double> imageOpacity;
  final Animation<Offset> meanAnimation;
//final Animation<double> contactOpacity;
}
