import 'package:flutter/material.dart';

class GradientAvatar extends StatelessWidget {
  final List<Color> gradientColors;
  final double radius;
  final Widget child;

  const GradientAvatar({super.key, 
    required this.gradientColors,
    this.radius = 30.0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: ClipOval(
          child: SizedBox(
            width: radius * 2,
            height: radius * 2,
            child: child,
          ),
        ),
      ),
    );
  }
}
