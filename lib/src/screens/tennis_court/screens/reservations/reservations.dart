import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tenniscourt/src/models/reservation.dart';

import 'package:tenniscourt/src/constants/color.dart';
import 'package:tenniscourt/src/constants/design.dart';
import 'package:tenniscourt/src/constants/extensions.dart';
import 'package:tenniscourt/src/constants/images_assets.dart';
import 'package:tenniscourt/src/providers/reservations.dart';

import 'package:tenniscourt/src/widgets/ui/buttons/button.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(23.0, 41.0, 23.0, 32.0),
          sliver: SliverToBoxAdapter(
            child: Button(
              onPressed: () {},
              title: 'Programar reserva',
              textStyle: textTheme.headlineMedium!
                  .copyWith(color: AppColors.textSecondary),
              asset: iconCalendarAsset,
              width: double.infinity,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Mis reservas',
              style: textTheme.headlineMedium,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 16.0,
          ),
        ),
        SliverFillRemaining(
          child: Consumer<ReservationsProvider>(
            builder: (context, provider, _) => ListView.builder(
                itemCount: provider.reservations.length + 1,
                itemBuilder: (context, index) {
                  if (index > provider.reservations.length - 1) {
                    return const SizedBox(
                      height: 20.0,
                    );
                  }

                  ReservationModel reservation = provider.reservations[index];

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(23.0, 0.0, 23.0, 16.0),
                    child: MyReservationCard(
                      reservation: reservation,
                    ),
                  );
                }),
          ),
        ),
      ],
    ));
  }
}

class MyReservationCard extends StatelessWidget {
  const MyReservationCard({super.key, required this.reservation});

  final ReservationModel reservation;

  @override
  Widget build(BuildContext context) {
    Size q = MediaQuery.sizeOf(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: q.width,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderSecondary),
          borderRadius: BorderRadius.circular(AppDesign.radius / 2)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    reservation.court.name,
                    style: textTheme.headlineMedium,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        iconHumidityAsset,
                        width: 18.0,
                      ),
                      const SizedBox(
                        width: AppDesign.padding / 2,
                      ),
                      Text(
                        reservation.court.humidity,
                        style: textTheme.bodyMedium!
                            .copyWith(fontFamily: 'Poppins'),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: AppDesign.padding,
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
                height: AppDesign.padding + 2,
              ),
              FittedBox(
                child: Row(
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
              ),
              const SizedBox(
                height: AppDesign.padding + 1,
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
