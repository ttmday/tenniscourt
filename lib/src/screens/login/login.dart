import 'package:flutter/material.dart';

import 'package:tenniscourt/src/screens/login/widgets/login_form.dart';
import 'package:tenniscourt/src/screens/login/widgets/login_title_screen.dart';

import 'package:tenniscourt/src/widgets/tenniscourt_background_top.dart';
import 'package:tenniscourt/src/widgets/ui/buttons/icon_back_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  LoginTitleScreen(),
                  SizedBox(
                    height: 46.0,
                  ),
                  LoginForm(),
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
