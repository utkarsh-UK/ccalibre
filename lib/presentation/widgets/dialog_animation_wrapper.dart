import 'package:flutter/material.dart';

class DialogAnimationWrapper extends StatelessWidget {
  final Animation<double> animationValue;
  final Widget child;

  const DialogAnimationWrapper({
    Key? key,
    required this.animationValue,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: animationValue.value,
      curve: Curves.bounceInOut,
      duration: const Duration(milliseconds: 300),
      child: AnimatedOpacity(
        opacity: animationValue.value,
        duration: const Duration(milliseconds: 300),
        child: child,
      ),
    );
  }
}
