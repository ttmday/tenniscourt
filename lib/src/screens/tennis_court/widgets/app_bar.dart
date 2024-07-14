import 'package:flutter/material.dart';
import 'package:tenniscourt/src/constants/color.dart';
import 'package:tenniscourt/src/constants/design.dart';
import 'package:tenniscourt/src/constants/images_assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    return Container(
      width: double.infinity,
      height: 64.0 + (paddingTop * 2),
      padding: EdgeInsets.fromLTRB(23.0, paddingTop, 23.0, 0),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 0, 23, 53),
        AppColors.accent,
        AppColors.primary
      ], stops: [
        .08,
        .8,
        1
      ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imageTennisCourtAsset,
            width: 144.0,
            fit: BoxFit.contain,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 12.0,
                backgroundColor: AppColors.background,
                child: Image.asset(
                  iconAvatarAsset,
                  width: 22.0,
                  height: 22.0,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: AppDesign.padding + 4,
              ),
              Image.asset(
                iconNotificationsAsset,
                width: 16.0,
                height: 20.0,
              ),
              const SizedBox(
                width: AppDesign.padding * 2,
              ),
              Image.asset(
                iconMenuAsset,
                width: 22.0,
                height: 16.0,
                fit: BoxFit.contain,
              ),
            ],
          )
        ],
      ),
    );
  }
}
