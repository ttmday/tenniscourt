import 'package:tenniscourt/src/constants/images_assets.dart';
import 'package:tenniscourt/src/models/reservation.dart';
import 'package:tenniscourt/src/data/courts.dart';

List<ReservationModel> reservationsMock = [
  ReservationModel(
      court: courtsMock[0],
      reservedBy:
          const ReservedBy(name: 'Andrea Gómez', avatar: iconAvatarAsset),
      instructor: 'Mark Gonzales',
      comment:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      time: '11:00 a 13:00 hrs',
      priceToPay: '\$${(courtsMock[0].price * 2).round()}',
      dateTime: DateTime(2024, 7, 6),
      howManyHours: 2),
  ReservationModel(
      court: courtsMock[2],
      reservedBy:
          const ReservedBy(name: 'Andrea Gómez', avatar: iconAvatarAsset),
      instructor: 'Mark Gonzales',
      comment:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      time: '13:00 a 16:00 hrs',
      priceToPay: '\$${(courtsMock[2].price * 1).round()}',
      dateTime: DateTime(2024, 7, 10),
      howManyHours: 1),
  ReservationModel(
      court: courtsMock[3],
      reservedBy:
          const ReservedBy(name: 'Andrea Gómez', avatar: iconAvatarAsset),
      instructor: 'Mark Gonzales',
      comment:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      time: '13:00 a 16:00 hrs',
      priceToPay: '\$${(courtsMock[3].price * 2).round()}',
      dateTime: DateTime(2024, 7, 12),
      howManyHours: 2)
];
