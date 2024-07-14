import 'package:go_router/go_router.dart';

import 'package:tenniscourt/src/screens/tennis_court/screens/favorites/favorites.dart';

class FavoritesRoute {
  const FavoritesRoute._();

  static const name = 'favorites';
  static const path = '/favorites';

  static StatefulShellBranch get branch => StatefulShellBranch(routes: [
        GoRoute(
            path: path,
            name: name,
            builder: (context, state) => const FavoritesScreen())
      ]);
}
