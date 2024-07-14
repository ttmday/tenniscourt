import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tenniscourt/src/routes/routes/register.dart';
import 'package:tenniscourt/src/routes/routes/tennis_court/routes/index.dart';

import 'package:tenniscourt/src/constants/color.dart';
import 'package:tenniscourt/src/constants/design.dart';
import 'package:tenniscourt/src/constants/images_assets.dart';

import 'package:tenniscourt/src/widgets/ui/buttons/button.dart';
import 'package:tenniscourt/src/widgets/ui/checkbox_with_label.dart';
import 'package:tenniscourt/src/widgets/ui/textformfield/custom_textformfield.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isSubmitting = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Form(
        child: Column(
      children: [
        CustomTextFormField(
          label: 'Email',
          controller: _emailController,
          icon: iconEnvelopeAsset,
        ),
        const SizedBox(
          height: 20.0,
        ),
        CustomTextFormField(
          label: 'Contraseña',
          controller: _passwordController,
          obscureText: true,
          icon: iconSecretAsset,
          suffixIcon: iconEyeAsset,
        ),
        const SizedBox(
          height: 13,
        ),
        CheckboxWithLabel(
          value: false,
          onChanged: (_) {},
          label: 'Recordar contraseña',
          style: textTheme.bodyMedium!.copyWith(fontFamily: 'Poppins'),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            '¿Olvidaste tu contraseña?',
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge!.copyWith(
              fontFamily: 'Poppins',
              color: AppColors.secondary,
            ),
          ),
        ),
        const SizedBox(
          height: 40.0,
        ),
        Button(
          onPressed: onLogin,
          title: 'Iniciar sesión',
          loading: _isSubmitting,
          textLoading: 'Iniciando sesión',
          width: double.infinity,
        ),
        const SizedBox(
          height: 64.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('¿Aun no tienes cuenta?',
                style: textTheme.bodyLarge!.copyWith(
                  fontFamily: 'Poppins',
                )),
            const SizedBox(
              width: AppDesign.padding,
            ),
            GestureDetector(
              onTap: () {
                context.push(RegisterRoute.path);
              },
              child: Text(
                'Regístrate',
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge!.copyWith(
                  fontFamily: 'Poppins',
                  color: AppColors.secondary,
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }

  onLogin() {
    setState(() {
      _isSubmitting = true;
    });
    sleep(const Duration(seconds: 2));

    context.go(HomeRoute.path);
  }
}
