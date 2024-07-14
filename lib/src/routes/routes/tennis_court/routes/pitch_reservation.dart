import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tenniscourt/src/models/court.dart';

import 'package:tenniscourt/src/providers/reservations.dart';
import 'package:tenniscourt/src/screens/tennis_court/screens/pitch_reservation/pitch_reservation.dart';

class PitchReservationRouteExtra {
  final CourtModel court;
  final ReservationsProvider reservationsProvider;

  PitchReservationRouteExtra(
      {required this.court, required this.reservationsProvider});
}

class PitchReservationRoute {
  const PitchReservationRoute._();

  static const name = 'pitch-reservation';
  static const path = '/pitch-reservation';

  static GoRoute get route => GoRoute(
      path: path,
      name: name,
      builder: (context, state) => ChangeNotifierProvider.value(
            value: (state.extra as PitchReservationRouteExtra)
                .reservationsProvider,
            child: PitchReservationScreen(
                court: (state.extra as PitchReservationRouteExtra).court),
          ));
}
