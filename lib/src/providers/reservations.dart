import 'package:flutter/material.dart';
import 'package:tenniscourt/src/models/reservation.dart';

class ReservationsProvider extends ChangeNotifier {
  final List<ReservationModel> reservations;

  ReservationsProvider(this.reservations);

  addReservation(ReservationModel reservation) {
    reservations.insert(0, reservation);
    notifyListeners();
  }
}
