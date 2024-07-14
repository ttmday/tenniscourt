import 'package:equatable/equatable.dart';

class CourtModel extends Equatable {
  final String image;
  final String name;
  final CourtType type;
  final DateTime dateTime;
  final String openHour;
  final String closeHour;
  final String humidity;
  final String location;
  final double price;
  final List<String> instructors;

  const CourtModel(
      {required this.image,
      required this.name,
      required this.type,
      required this.dateTime,
      required this.openHour,
      required this.closeHour,
      required this.humidity,
      required this.location,
      required this.price,
      required this.instructors});

  String get availability {
    if (openHour.isEmpty || closeHour.isEmpty) {
      return '';
    }

    return '$openHour a $closeHour';
  }

  String get priceCurrency => '\$${price.round()}';

  @override
  List<Object> get props => [
        image,
        name,
        type,
        dateTime,
        openHour,
        closeHour,
        humidity,
        location,
        price,
        instructors
      ];

  @override
  bool get stringify => true;
}

enum CourtType {
  A(value: 'A'),
  B(value: 'B'),
  C(value: 'C');

  const CourtType({required this.value});

  final String value;

  String get description => 'Cancha tipo $value';
}
