import 'dart:async';

import 'package:app/core/utils/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'splash_view_state.dart';

class SplashViewCubit extends Cubit<SplashViewStates> {
  SplashViewCubit() : super(SplashViewInitialState());

  bool isInCenter = false;
  bool isRectangle = false;
  bool isExpanded = false;

  late Timer timer1;
  late Timer timer2;
  late Timer timer3;
  late Timer timer4;

  void changeSplashStates(BuildContext context) {
    timer1 = Timer(const Duration(milliseconds: 100), () {
      isInCenter = true;
      emit(AnimationChangedState());
    });

    timer2 = Timer(const Duration(milliseconds: 1500), () {
      isRectangle = true;
      emit(AnimationChangedState());
    });

    timer3 = Timer(const Duration(milliseconds: 5000), () {
      isExpanded = true;
      emit(AnimationChangedState());
    });

    timer4 = Timer(const Duration(milliseconds: 5650), () {
      _navigateBasedOnCondition(context);
    });
  }

  void cancelTimers() {
    timer1.cancel();
    timer2.cancel();
    timer3.cancel();
    timer4.cancel();
  }

  void _navigateBasedOnCondition(BuildContext context) {
    // String? token = getIt<SharedPreferences>().getString('token');
    // bool? onboarding = getIt<SharedPreferences>().getBool('onboarding');

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        GoRouter.of(context).pushReplacement(AppRouter.onBoardingViewPath);
        return;
      } else {
        GoRouter.of(context).pushReplacement(AppRouter.mainPageViewPath);
        return;
      }
    });

    // if (token != null) {
    //   Navigator.of(context).pushReplacementNamed(AppRouter.mainPagePath);
    // } else if (onboarding == true) {
    //   Navigator.of(context).pushReplacementNamed(AppRouter.signInViewPath);
    // } else {
    //   Navigator.of(context).pushReplacementNamed(AppRouter.onBoardingViewPath);
    // }
  }

  @override
  Future<void> close() {
    cancelTimers();
    return super.close();
  }
}
