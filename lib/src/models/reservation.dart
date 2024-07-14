import 'package:equatable/equatable.dart';
import 'package:tenniscourt/src/models/court.dart';

final class ReservationModel extends Equatable {
  final CourtModel court;
  final ReservedBy reservedBy;
  final String instructor;
  final String comment;
  final String priceToPay;
  final String time;
  final DateTime dateTime;
  final int howManyHours;

  const ReservationModel({
    required this.court,
    required this.reservedBy,
    required this.instructor,
    required this.comment,
    required this.time,
    required this.priceToPay,
    required this.dateTime,
    required this.howManyHours,
  });

  ReservationModel copyWith({
    ReservedBy? reservedBy,
    String? instructor,
    String? comment,
    String? time,
    String? priceToPay,
    DateTime? dateTime,
    int? howManyHours,
  }) =>
      ReservationModel(
          court: court,
          reservedBy: reservedBy ?? this.reservedBy,
          instructor: instructor ?? this.instructor,
          comment: comment ?? this.comment,
          time: time ?? this.time,
          priceToPay: priceToPay ?? this.priceToPay,
          dateTime: dateTime ?? this.dateTime,
          howManyHours: howManyHours ?? this.howManyHours);

  @override
  List<Object> get props =>
      [court, reservedBy, instructor, comment, time, dateTime, howManyHours];

  @override
  bool get stringify => true;
}

final class ReservedBy extends Equatable {
  final String name;
  final String avatar;

  const ReservedBy({required this.name, required this.avatar});

  @override
  List<Object> get props => [name, avatar];

  @override
  bool get stringify => true;
}
