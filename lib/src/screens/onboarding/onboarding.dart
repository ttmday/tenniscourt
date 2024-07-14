import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tenniscourt/src/constants/design.dart';
import 'package:tenniscourt/src/routes/routes/index.dart';
import 'package:tenniscourt/src/routes/routes/register.dart';
import 'package:tenniscourt/src/widgets/tenniscourt_logo.dart';
import 'package:tenniscourt/src/widgets/ui/buttons/button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size q = MediaQuery.sizeOf(context);
    return Scaffold(
        body: Container(
      width: q.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/png/splash.png'),
            fit: BoxFit.cover,
            alignment: Alignment.centerRight),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDesign.padding * 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 90.0,
            ),
            const TenniscourtLogo(),
            const Spacer(),
            Column(
              children: [
                Button(
                  onPressed: () {
                    context.push(LoginRoute.path);
                  },
                  title: 'Iniciar sesión',
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Button(
                  onPressed: () {
                    context.push(RegisterRoute.path);
                  },
                  title: 'Registrarme',
                  width: double.infinity,
                  variant: ButtonVariant.secondary,
                ),
              ],
            ),
            const SizedBox(
              height: 51.0,
            ),
          ],
        ),
      ),
    ));
  }
}
