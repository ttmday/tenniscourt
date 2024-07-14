import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tenniscourt/src/data/reservations.dart';
import 'package:tenniscourt/src/providers/reservations.dart';
import 'package:tenniscourt/src/screens/tennis_court/widgets/app_bar.dart';

import 'package:tenniscourt/src/screens/tennis_court/widgets/bottom_navigation.dart';

class TennisCourtScreen extends StatelessWidget {
  const TennisCourtScreen({super.key, required this.shell});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ReservationsProvider>(
            create: (context) => ReservationsProvider(reservationsMock))
      ],
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 64),
          child: CustomAppBar(),
        ),
        body: shell,
        bottomNavigationBar: CustomBottomNavigation(
          active: shell.currentIndex,
          onPressed: (int branch) {
            shell.goBranch(branch);
          },
        ),
      ),
    );
  }
}
