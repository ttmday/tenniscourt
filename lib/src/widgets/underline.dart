import 'package:flutter/material.dart';
import 'package:tenniscourt/src/constants/color.dart';

class Underline extends StatelessWidget {
  const Underline({
    super.key,
    required this.width,
    this.color,
  });

  final double width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color ?? AppColors.secondary,
      child: SizedBox(
        width: width,
        height: 1.2,
      ),
    );
  }
}
