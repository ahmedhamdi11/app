import 'package:app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppThemes {
  static ThemeData darkTheme = ThemeData(
    // text theme
    textTheme: GoogleFonts.rubikTextTheme(),

    // dialog theme
    dialogTheme: const DialogTheme(
      surfaceTintColor: Colors.black,
    ),

    // color scheme
    colorScheme: ColorScheme.fromSeed(
      seedColor: kPrimaryColor,
      brightness: Brightness.dark,
    ),

    // app bar theme
    appBarTheme: const AppBarTheme(backgroundColor: kBackgroundColor),

    scaffoldBackgroundColor: kBackgroundColor,

    useMaterial3: true,
  );
}
