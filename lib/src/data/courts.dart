import 'package:tenniscourt/src/models/court.dart';

List<CourtModel> courtsMock = [
  CourtModel(
      image: 'assets/images/png/court-1.png',
      name: 'Epic Box',
      type: CourtType.A,
      dateTime: DateTime(2024, 7, 9),
      openHour: '7:00 am',
      closeHour: '4:00 pm',
      humidity: '30%',
      location: 'Vía Av. Caracas y Av. P.º Caroni',
      price: 25,
      instructors: const [
        'Mark Gonzales',
        'Alvaro Hernandez',
        'Jaime Rodriguez'
      ]),
  CourtModel(
      image: 'assets/images/png/court-2.png',
      name: 'Sport Box',
      type: CourtType.A,
      dateTime: DateTime(2024, 7, 10),
      openHour: '',
      closeHour: '',
      humidity: '30%',
      location: 'Vía Av. Caracas y Av. P.º Caroni',
      price: 25,
      instructors: const ['Mark Gonzales']),
  CourtModel(
      image: 'assets/images/png/court-2.png',
      name: 'Rusty Tenis',
      type: CourtType.C,
      dateTime: DateTime(2024, 7, 10),
      openHour: '7:00 am',
      closeHour: '4:00 pm',
      humidity: '60%',
      location: 'Vía Av. Caracas y Av. P.º Caroni',
      price: 25,
      instructors: const ['Mark Gonzales']),
  CourtModel(
      image: 'assets/images/jpg/court-3.jpg',
      name: 'Cancha Multiple',
      type: CourtType.B,
      dateTime: DateTime(2024, 7, 12),
      openHour: '7:00 am',
      closeHour: '4:00 pm',
      humidity: '30%',
      location: 'Vía Av. Caracas y Av. P.º Caroni',
      price: 25,
      instructors: const ['Mark Gonzales']),
];
