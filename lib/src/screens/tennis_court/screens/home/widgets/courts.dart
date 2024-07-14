import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:tenniscourt/src/constants/color.dart';
import 'package:tenniscourt/src/constants/design.dart';
import 'package:tenniscourt/src/constants/extensions.dart';
import 'package:tenniscourt/src/constants/images_assets.dart';
import 'package:tenniscourt/src/models/court.dart';
import 'package:tenniscourt/src/data/courts.dart';

import 'package:tenniscourt/src/providers/reservations.dart';
import 'package:tenniscourt/src/routes/routes/index.dart';

class Courts extends StatelessWidget {
  const Courts({super.key});

  @override
  Widget build(BuildContext context) {
    Size q = MediaQuery.sizeOf(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      height: 378.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 23.0),
            child: Text(
              'Canchas',
              style: textTheme.headlineMedium,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          SizedBox(
            width: q.width,
            height: 337.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: courtsMock.length,
                padding: const EdgeInsets.only(left: 23.0),
                itemBuilder: (context, index) {
                  CourtModel court = courtsMock[index];

                  return Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: CourtCard(court: court),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class CourtCard extends StatelessWidget {
  const CourtCard({
    super.key,
    required this.court,
  });

  final CourtModel court;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: 245.0,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.all(Radius.circular(AppDesign.radius - 12)),
          border: Border.all(color: AppColors.borderSecondary)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: Image.asset(
              court.image,
              width: double.infinity,
              height: 137.0,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15.25, 12.0, 15.25, 3.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        court.name,
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
                            court.humidity,
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
                  Text(
                    court.type.description,
                    style:
                        textTheme.bodyMedium!.copyWith(fontFamily: 'Poppins'),
                  ),
                  const SizedBox(
                    height: AppDesign.padding + 4,
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
                        court.dateTime.todMonthYear(),
                        style: textTheme.bodyMedium!
                            .copyWith(fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  court.availability.isNotEmpty
                      ? FittedBox(
                          child: Row(
                            children: [
                              Text(
                                'Disponible',
                                style: textTheme.bodyMedium!
                                    .copyWith(fontFamily: 'Poppins'),
                              ),
                              const SizedBox(
                                width: AppDesign.padding,
                              ),
                              Container(
                                width: 8.0,
                                height: 8.0,
                                decoration: const BoxDecoration(
                                    color: AppColors.secondary,
                                    shape: BoxShape.circle),
                              ),
                              const SizedBox(
                                width: AppDesign.padding,
                              ),
                              Image.asset(
                                iconTimeAsset,
                                height: 12.0,
                              ),
                              const SizedBox(
                                width: AppDesign.padding / 2,
                              ),
                              Text(
                                court.availability,
                                style: textTheme.bodyMedium!
                                    .copyWith(fontFamily: 'Poppins'),
                              ),
                            ],
                          ),
                        )
                      : Text(
                          'No disponible',
                          style: textTheme.bodyMedium!
                              .copyWith(fontFamily: 'Poppins'),
                        ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: MaterialButton(
                      onPressed: () {
                        ReservationsProvider reservationsProvider =
                            context.read<ReservationsProvider>();
                        context.push(PitchReservationRoute.path,
                            extra: PitchReservationRouteExtra(
                                court: court,
                                reservationsProvider: reservationsProvider));
                      },
                      elevation: 0,
                      color: AppColors.accent,
                      height: 32.0,
                      minWidth: 144.0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      child: Text(
                        'Reservar',
                        style: textTheme.bodyLarge!.copyWith(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: AppColors.textSecondary),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
