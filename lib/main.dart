import 'package:app/core/constants/constants.dart';
import 'package:app/core/utils/app_router.dart';
import 'package:app/observer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  Bloc.observer = MyBlocObserver(); // my bloc observer
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      title: 'App',
      theme: ThemeData(
        fontFamily: 'jannah',
        appBarTheme: AppBarTheme(
          elevation: 2,
          titleTextStyle: GoogleFonts.lobster(
            fontSize: 20,
          ),
        ),
        dialogTheme: const DialogTheme(
          surfaceTintColor: Colors.black,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimaryColor,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
    );
  }
}
