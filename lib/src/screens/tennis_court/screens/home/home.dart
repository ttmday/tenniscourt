import 'package:flutter/material.dart';
import 'package:tenniscourt/src/constants/color.dart';
import 'package:tenniscourt/src/screens/tennis_court/screens/home/widgets/courts.dart';
import 'package:tenniscourt/src/screens/tennis_court/screens/home/widgets/sheduled_reservations.dart';
import 'package:tenniscourt/src/widgets/greatting.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: AppColors.background,
            surfaceTintColor: AppColors.background,
            titleSpacing: 0,
            title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.0),
                child: Greatting('Andrea')),
          ),
          SliverToBoxAdapter(
            child: Divider(
              height: 2.0,
              color: AppColors.mutedForeground.withOpacity(.2),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.only(top: 21.0, bottom: 20.0),
            sliver: SliverToBoxAdapter(
              child: Courts(),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              height: 2.0,
              color: AppColors.mutedForeground.withOpacity(.2),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 21.0, bottom: 20.0),
            sliver: SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 23.0),
                child: Text(
                  'Reservas programadas',
                  style: textTheme.headlineMedium,
                ),
              ),
            ),
          ),
          const SheduledReservations(),
          const SliverPadding(padding: EdgeInsets.only(bottom: 20.0))
        ],
      ),
    );
  }
}
