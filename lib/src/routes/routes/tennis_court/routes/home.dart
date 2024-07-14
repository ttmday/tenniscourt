import 'package:go_router/go_router.dart';

import 'package:tenniscourt/src/screens/tennis_court/screens/home/home.dart';

class HomeRoute {
  const HomeRoute._();

  static const name = 'home';
  static const path = '/home';

  static StatefulShellBranch get branch => StatefulShellBranch(routes: [
        GoRoute(
            path: path,
            name: name,
            builder: (context, state) => const HomeScreen())
      ]);
}
