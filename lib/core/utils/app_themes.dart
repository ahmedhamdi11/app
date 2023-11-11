import 'package:app/core/constants/constants.dart';
import 'package:app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppThemes {
  static ThemeData darkTheme = ThemeData(
    // text theme
    textTheme: GoogleFonts.rubikTextTheme(),

    // dialog theme
    dialogTheme: const DialogTheme(
      backgroundColor: kBackgroundColor,
    ),

    // color scheme
    colorScheme: ColorScheme.fromSeed(
      seedColor: kPrimaryColor,
      brightness: Brightness.dark,
    ),

    // app bar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: kBackgroundColor,
      titleTextStyle: AppStyles.text22,
      scrolledUnderElevation: 0,
    ),

    scaffoldBackgroundColor: kBackgroundColor,

    useMaterial3: true,
  );
}
