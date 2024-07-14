import 'package:flutter/material.dart';

import 'package:tenniscourt/src/models/court.dart';

import 'package:tenniscourt/src/constants/color.dart';
import 'package:tenniscourt/src/constants/design.dart';
import 'package:tenniscourt/src/constants/images_assets.dart';

class CourtInfo extends StatelessWidget {
  const CourtInfo({super.key, required this.court});

  final CourtModel court;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  court.name,
                  style: textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: AppDesign.padding / 2,
                ),
                Text(
                  court.type.description,
                  style: textTheme.bodyMedium!.copyWith(fontFamily: 'Poppins'),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  court.priceCurrency,
                  style: textTheme.headlineLarge!
                      .copyWith(color: AppColors.secondary),
                ),
                const SizedBox(
                  height: AppDesign.padding / 2,
                ),
                Text(
                  'Por hora',
                  style: textTheme.bodyMedium!.copyWith(
                      fontFamily: 'Poppins', color: AppColors.mutedForeground),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: AppDesign.padding + 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                    style:
                        textTheme.bodyMedium!.copyWith(fontFamily: 'Poppins'),
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
                  style: textTheme.bodyMedium!.copyWith(fontFamily: 'Poppins'),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: AppDesign.padding + 4,
        ),
        Row(
          children: [
            Text(
              court.location,
              style: textTheme.bodyMedium!.copyWith(
                fontFamily: 'Poppins',
              ),
            ),
          ],
        )
      ],
    );
  }
}
