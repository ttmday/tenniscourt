import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tenniscourt/src/constants/color.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData getTheme() {
    return ThemeData(
        fontFamily: 'Poppins',
        primaryColor: AppColors.primary,
        useMaterial3: true,
        textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColors.text,
            selectionColor: AppColors.mutedForeground,
            selectionHandleColor: AppColors.mutedForeground),
        appBarTheme: const AppBarTheme(
            elevation: 0,
            color: AppColors.primary,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                systemNavigationBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light,
                systemNavigationBarIconBrightness: Brightness.light)),
        scaffoldBackgroundColor: AppColors.background,
        iconTheme:
            const IconThemeData(color: AppColors.accentForeground, size: 21.0),
        hintColor: AppColors.mutedForeground,
        cardColor: AppColors.mutedForeground,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24.0,
              color: AppColors.text,
              fontWeight: FontWeight.w600),
          headlineLarge: TextStyle(
              fontSize: 20.0,
              color: AppColors.text,
              fontWeight: FontWeight.w600),
          headlineMedium: TextStyle(
              fontSize: 18.0,
              color: AppColors.text,
              fontWeight: FontWeight.w500),
          headlineSmall: TextStyle(
              fontSize: 16.0,
              color: AppColors.text,
              fontWeight: FontWeight.w500),
          bodyLarge: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14.0,
              color: AppColors.text,
              fontWeight: FontWeight.w400),
          bodyMedium: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 12.0,
              color: AppColors.text,
              fontWeight: FontWeight.w400),
        ),
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.light(
          brightness: Brightness.dark,
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.background,
          tertiary: AppColors.foreground,
          outline: AppColors.foreground,
        ));
  }
}
