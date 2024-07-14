import 'package:flutter/material.dart';
import 'package:tenniscourt/src/constants/design.dart';

class Greatting extends StatelessWidget {
  const Greatting(
    this.name, {
    super.key,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppDesign.padding + 4, horizontal: 0),
      child: Text(
        'Hola ${name[0].toUpperCase()}${name.substring(1)}!',
        style: textTheme.headlineLarge,
      ),
    );
  }
}
