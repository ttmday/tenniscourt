import 'package:flutter/material.dart';
import 'package:tenniscourt/src/screens/register/widgets/register_form.dart';

import 'package:tenniscourt/src/screens/register/widgets/register_title_screen.dart';

import 'package:tenniscourt/src/widgets/tenniscourt_background_top.dart';
import 'package:tenniscourt/src/widgets/ui/buttons/icon_back_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double p = MediaQuery.paddingOf(context).top;
    return Scaffold(
        body: SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              const TenniscourtBackgroundTop(),
              Positioned(
                  top: 6.0 + p, left: 18.0, child: const IconBackButton())
            ],
          ),
          const Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(33.0, 40.0, 33.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegisterTitleScreen(),
                  SizedBox(
                    height: 40.0,
                  ),
                  RegisterForm(),
                  SizedBox(
                    height: 51.0,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
