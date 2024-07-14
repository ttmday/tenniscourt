import 'package:go_router/go_router.dart';

import 'package:tenniscourt/src/screens/register/register.dart';

class RegisterRoute {
  const RegisterRoute._();

  static const name = 'register';
  static const path = '/register';

  static GoRoute get route => GoRoute(
        path: path,
        name: name,
        builder: (context, state) => const RegisterScreen(),
      );
}
