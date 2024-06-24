import 'package:app/Features/Auth/data/repos/auth_repo_impl.dart';
import 'package:app/Features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:app/core/services/service_locator.dart';
import 'package:app/core/utils/app_router.dart';
import 'package:app/core/utils/app_themes.dart';
import 'package:app/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver(); // my bloc observer

  // setup service locator
  await setupServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepoImpl()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        title: 'Secure Shield',
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
