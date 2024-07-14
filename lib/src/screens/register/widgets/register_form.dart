import 'package:flutter/material.dart';

import 'package:tenniscourt/src/constants/images_assets.dart';

import 'package:tenniscourt/src/widgets/ui/buttons/button.dart';
import 'package:tenniscourt/src/widgets/ui/textformfield/custom_textformfield.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _fullnameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre y apellido',
            controller: TextEditingController(),
            icon: iconPersonAsset,
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomTextFormField(
            label: 'Email',
            controller: TextEditingController(),
            type: TextInputType.emailAddress,
            icon: iconEnvelopeAsset,
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomTextFormField(
            label: 'Teléfono',
            controller: TextEditingController(),
            type: TextInputType.phone,
            icon: iconPhoneAsset,
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomTextFormField(
            label: 'Contraseña',
            controller: TextEditingController(),
            obscureText: true,
            icon: iconSecretAsset,
            suffixIcon: iconEyeAsset,
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomTextFormField(
            label: 'Confirmar contraseña',
            controller: TextEditingController(),
            obscureText: true,
            icon: iconSecretAsset,
            suffixIcon: iconEyeAsset,
          ),
          const SizedBox(
            height: 40.0,
          ),
          Button(
            onPressed: () {},
            title: 'Registrarme',
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
