import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tenniscourt/src/routes/routes/index.dart';

final GlobalKey<NavigatorState> _navigatorRoot = GlobalKey<NavigatorState>();

class AppRouter {
  late final GoRouter router = GoRouter(
      navigatorKey: _navigatorRoot,
      initialLocation: OnboardingRoute.path,
      routes: [
        OnboardingRoute.route,
        LoginRoute.route,
        RegisterRoute.route,
        TennisCourtRoute.route,
        PitchReservationRoute.route
      ]);
}
