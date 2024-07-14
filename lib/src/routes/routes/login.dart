import 'package:go_router/go_router.dart';
import 'package:tenniscourt/src/screens/login/login.dart';

class LoginRoute {
  const LoginRoute._();

  static const name = 'login';
  static const path = '/login';

  static GoRoute get route => GoRoute(
        path: path,
        name: name,
        builder: (context, state) => const LoginScreen(),
      );
}
