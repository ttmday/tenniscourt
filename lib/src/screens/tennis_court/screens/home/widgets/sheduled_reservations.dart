import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tenniscourt/src/constants/color.dart';
import 'package:tenniscourt/src/constants/design.dart';
import 'package:tenniscourt/src/constants/extensions.dart';
import 'package:tenniscourt/src/constants/images_assets.dart';

import 'package:tenniscourt/src/models/reservation.dart';

import 'package:tenniscourt/src/providers/reservations.dart';

class SheduledReservations extends StatelessWidget {
  const SheduledReservations({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ReservationsProvider>(
        builder: (context, provider, _) => SliverList.builder(
            itemCount: provider.reservations.length,
            itemBuilder: (context, index) {
              ReservationModel reservation = provider.reservations[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: AppDesign.padding),
                child: ReservationCard(reservation: reservation),
              );
            }));
  }
}

class ReservationCard extends StatelessWidget {
  const ReservationCard({super.key, required this.reservation});

  final ReservationModel reservation;

  @override
  Widget build(BuildContext context) {
    Size q = MediaQuery.sizeOf(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: q.width,
      height: 126.0,
      padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 13.0),
      decoration: const BoxDecoration(color: AppColors.foreground),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDesign.radius / 2),
            child: Image.asset(
              reservation.court.image,
              width: 60.0,
              height: 60.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: AppDesign.padding,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                reservation.court.name,
                style: textTheme.headlineMedium,
              ),
              const SizedBox(
                height: AppDesign.padding - 2,
              ),
              Row(
                children: [
                  Image.asset(
                    iconCalendarAsset,
                    height: 12.0,
                  ),
                  const SizedBox(
                    width: AppDesign.padding,
                  ),
                  Text(
                    reservation.court.dateTime.todMonthYear(),
                    style:
                        textTheme.bodyMedium!.copyWith(fontFamily: 'Poppins'),
                  ),
                ],
              ),
              const SizedBox(
                height: AppDesign.padding - 2,
              ),
              Row(
                children: [
                  Text(
                    'Reservado por: ',
                    style:
                        textTheme.bodyMedium!.copyWith(fontFamily: 'Poppins'),
                  ),
                  const SizedBox(
                    width: AppDesign.padding,
                  ),
                  Image.asset(
                    reservation.reservedBy.avatar,
                    width: 24.0,
                  ),
                  const SizedBox(
                    width: AppDesign.padding / 2,
                  ),
                  Text(
                    reservation.reservedBy.name,
                    style:
                        textTheme.bodyMedium!.copyWith(fontFamily: 'Poppins'),
                  ),
                ],
              ),
              const SizedBox(
                height: AppDesign.padding / 2,
              ),
              Row(
                children: [
                  Image.asset(
                    iconTimeAsset,
                    height: 12.0,
                  ),
                  const SizedBox(
                    width: AppDesign.padding,
                  ),
                  Text(
                    '${reservation.howManyHours} horas',
                    style:
                        textTheme.bodyMedium!.copyWith(fontFamily: 'Poppins'),
                  ),
                  const SizedBox(
                    width: AppDesign.padding / 2,
                  ),
                  SizedBox(
                    height: 12.0,
                    child: VerticalDivider(
                      color: AppColors.mutedForeground.withOpacity(.85),
                    ),
                  ),
                  const SizedBox(
                    width: AppDesign.padding / 2,
                  ),
                  Text(
                    reservation.priceToPay,
                    style: textTheme.bodyMedium!.copyWith(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
