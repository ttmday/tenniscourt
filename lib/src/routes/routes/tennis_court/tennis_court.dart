import 'package:go_router/go_router.dart';
import 'package:tenniscourt/src/routes/routes/tennis_court/routes/favorites.dart';
import 'package:tenniscourt/src/routes/routes/tennis_court/routes/home.dart';
import 'package:tenniscourt/src/routes/routes/tennis_court/routes/reservations.dart';
import 'package:tenniscourt/src/screens/tennis_court/tennis_court_screen.dart';

class TennisCourtRoute {
  const TennisCourtRoute._();

  static const name = 'tennis-court';
  static const path = '/tennis-court';

  static StatefulShellRoute get route => StatefulShellRoute.indexedStack(
          builder: (context, state, shell) => TennisCourtScreen(shell: shell),
          branches: [
            HomeRoute.branch,
            ReservationsRoute.branch,
            FavoritesRoute.branch
          ]);
}
