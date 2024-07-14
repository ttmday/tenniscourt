import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tenniscourt/src/constants/color.dart';
import 'package:tenniscourt/src/constants/design.dart';
import 'package:tenniscourt/src/constants/extensions.dart';

import 'package:tenniscourt/src/constants/images_assets.dart';
import 'package:tenniscourt/src/models/reservation.dart';
import 'package:tenniscourt/src/providers/reservations.dart';
import 'package:tenniscourt/src/routes/routes/tennis_court/routes/index.dart';
import 'package:tenniscourt/src/screens/tennis_court/screens/pitch_reservation/widgets/court_info.dart';
import 'package:tenniscourt/src/widgets/ui/buttons/button.dart';

import 'package:tenniscourt/src/widgets/ui/buttons/icon_back_button.dart';

class PitchReservationPayScreen extends StatelessWidget {
  const PitchReservationPayScreen({super.key, required this.reservation});

  final ReservationModel reservation;

  @override
  Widget build(BuildContext context) {
    Size q = MediaQuery.sizeOf(context);
    double insetsTop = MediaQuery.paddingOf(context).top;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SizedBox(
        width: q.width,
        height: q.height,
        child: Column(children: [
          Container(
            width: q.width,
            height: 209.0,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    stops: [.25, .6],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Stack(
              children: [
                Image.asset(
                  reservation.court.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                    top: 24.0 + insetsTop / 2,
                    left: 23.0,
                    right: 23.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const IconBackButton(),
                        GestureDetector(
                            child: Image.asset(
                          iconFavoriteAsset,
                          height: 30.0,
                        ))
                      ],
                    ))
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 24.0, left: 23.0, right: 23.0),
                    decoration: const BoxDecoration(
                      color: AppColors.background,
                    ),
                    child: CourtInfo(court: reservation.court),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 129.0,
                    color: AppColors.foreground,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 23.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Resumen',
                          style: textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: AppDesign.padding + 4,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          iconCourtAsset,
                                          width: 18.0,
                                        ),
                                        const SizedBox(
                                          width: AppDesign.padding / 2,
                                        ),
                                        Text(
                                          reservation.court.type.description,
                                          style: textTheme.bodyMedium!
                                              .copyWith(fontFamily: 'Poppins'),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          iconCalendarAsset,
                                          width: 18.0,
                                        ),
                                        const SizedBox(
                                          width: AppDesign.padding / 2,
                                        ),
                                        Text(
                                          reservation.dateTime.todMonthYear(),
                                          style: textTheme.bodyMedium!
                                              .copyWith(fontFamily: 'Poppins'),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: AppDesign.padding,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 180.0,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            iconUserAsset,
                                            width: 18.0,
                                          ),
                                          const SizedBox(
                                            width: AppDesign.padding / 2,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Instructor: ${reservation.instructor}',
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: textTheme.bodyMedium!
                                                  .copyWith(
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 16.0,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            iconTimeAsset,
                                            width: 18.0,
                                          ),
                                          const SizedBox(
                                            width: AppDesign.padding / 2,
                                          ),
                                          Text(
                                            '${reservation.howManyHours} horas',
                                            style: textTheme.bodyMedium!
                                                .copyWith(
                                                    fontFamily: 'Poppins'),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 27.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 23.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total a pagar',
                              style: textTheme.headlineMedium,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  reservation.priceToPay,
                                  style: textTheme.headlineMedium!
                                      .copyWith(color: AppColors.secondary),
                                ),
                                const SizedBox(
                                  height: AppDesign.padding / 2,
                                ),
                                Text(
                                  'Por ${reservation.howManyHours} horas',
                                  style: textTheme.bodyMedium!.copyWith(
                                      color: AppColors.mutedForeground),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 232.0),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          minWidth: 232.0,
                          height: 42.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(color: AppColors.secondary),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                iconCalendarAsset,
                                width: 24.0,
                                color: AppColors.secondary,
                              ),
                              const SizedBox(
                                width: AppDesign.padding,
                              ),
                              Text(
                                'Reprogramar reserva',
                                style: textTheme.bodyLarge!.copyWith(
                                    fontFamily: 'Poppins',
                                    color: AppColors.secondary),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23.0),
                    child: Button(
                      onPressed: () {
                        context
                            .read<ReservationsProvider>()
                            .addReservation(reservation);
                        context.go(ReservationsRoute.path);
                      },
                      title: 'Pagar',
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23.0),
                    child: Button(
                      onPressed: () {
                        context.go(HomeRoute.path);
                      },
                      variant: ButtonVariant.outline,
                      title: 'Cancelar',
                    ),
                  ),
                  const SizedBox(
                    height: 86.0,
                  )
                ]),
          ))
        ]),
      ),
    );
  }
}
