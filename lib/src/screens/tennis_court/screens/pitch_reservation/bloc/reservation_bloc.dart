import 'package:tenniscourt/src/models/reservation.dart';

class ReservationBloC {
  late ReservationModel reservation;

  ReservationBloC(this.reservation);

  setInstructor(String instructor) {
    reservation = reservation.copyWith(instructor: instructor);
  }

  setDateTime(DateTime date) {
    reservation = reservation.copyWith(dateTime: date);
  }

  setTime(String time) {
    List<String> t = time.split(' ');
    int oh = int.tryParse(t[0].split(':')[0]) ?? 0;
    int ch = int.tryParse(t[2].split(':')[0]) ?? 0;
    DateTime start = DateTime.now().add(Duration(hours: oh));
    DateTime end = DateTime.now().add(Duration(hours: ch));

    int howManyHours = end.difference(start).inHours;

    reservation = reservation.copyWith(
        time: time,
        howManyHours: howManyHours,
        priceToPay: '\$${(howManyHours * reservation.court.price).round()}');
  }

  setComment(String comment) {
    reservation = reservation.copyWith(comment: comment);
  }
}
