import 'package:go_router/go_router.dart';

import 'package:tenniscourt/src/screens/tennis_court/screens/reservations/reservations.dart';

class ReservationsRoute {
  const ReservationsRoute._();

  static const name = 'reservations';
  static const path = '/reservations';

  static StatefulShellBranch get branch => StatefulShellBranch(routes: [
        GoRoute(
            path: path,
            name: name,
            builder: (context, state) => const ReservationsScreen())
      ]);
}
