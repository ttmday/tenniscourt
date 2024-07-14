import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:tenniscourt/src/constants/theme.dart';
import 'package:tenniscourt/src/routes/router.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [Provider(create: (_) => AppRouter())],
        builder: (context, _) {
          final router = context.read<AppRouter>().router;

          Future.delayed(const Duration(seconds: 2), () {
            FlutterNativeSplash.remove();
          }).then((_) {});

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            theme: AppTheme.getTheme(),
          );
        });
  }
}
