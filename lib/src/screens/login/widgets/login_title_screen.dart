import 'package:flutter/material.dart';

import 'package:tenniscourt/src/constants/design.dart';
import 'package:tenniscourt/src/widgets/underline.dart';

class LoginTitleScreen extends StatelessWidget {
  const LoginTitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Iniciar sesión',
          style: textTheme.displayLarge,
        ),
        const SizedBox(
          height: AppDesign.padding * .6,
        ),
        const Underline(
          width: 80.0,
        )
      ],
    );
  }
}
