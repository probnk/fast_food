import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class SlideInScooter extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> _animation;

  SlideInScooter({required this.controller})
      : _animation = Tween<double>(begin: -200, end: 0).animate(
    CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_animation.value, 0),
          child: child,
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 318,
        padding: EdgeInsets.only(bottom: 70),
        child: Image.asset("assets/images/scooter.png",height: 300,width:MediaQuery.of(context).size.width ,),
      ),
    );
  }
}