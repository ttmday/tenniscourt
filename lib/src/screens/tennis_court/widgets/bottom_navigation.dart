import 'package:flutter/material.dart';
import 'package:tenniscourt/src/constants/color.dart';
import 'package:tenniscourt/src/constants/design.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation(
      {super.key, required this.active, required this.onPressed});

  final int active;
  final void Function(int branch) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.0,
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
      decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(AppDesign.radius / 2)),
          boxShadow: [
            BoxShadow(
              color: AppColors.mutedForeground,
              offset: Offset(0.0, 3.0),
              blurRadius: 5.0,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavigationItem(
            onPressed: () {
              onPressed(0);
            },
            label: 'Inicio',
            icon: Icons.home_filled,
            active: active == 0,
          ),
          BottomNavigationItem(
            onPressed: () {
              onPressed(1);
            },
            label: 'Reservas',
            icon: active == 1 ? Icons.date_range : Icons.date_range_outlined,
            active: active == 1,
          ),
          BottomNavigationItem(
            onPressed: () {
              onPressed(2);
            },
            label: 'Favoritos',
            icon: active == 2 ? Icons.favorite : Icons.favorite_border,
            active: active == 2,
          ),
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem(
      {super.key,
      required this.onPressed,
      required this.label,
      required this.icon,
      this.active = false});

  final String label;
  final IconData icon;
  final bool? active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return MaterialButton(
      onPressed: onPressed,
      elevation: 0,
      minWidth: 70.0,
      height: 50.0,
      padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 10.0),
      color: active == true ? AppColors.accent : null,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(13.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24.0,
            color: active == true
                ? AppColors.accentForeground
                : AppColors.text.withOpacity(.65),
          ),
          const SizedBox(
            height: AppDesign.padding / 2,
          ),
          Text(
            label,
            style: textTheme.bodyMedium!.copyWith(
                fontFamily: 'Poppins',
                fontWeight:
                    active == true ? FontWeight.w500 : FontWeight.normal,
                color: active == true
                    ? AppColors.accentForeground
                    : AppColors.text),
          )
        ],
      ),
    );
  }
}
