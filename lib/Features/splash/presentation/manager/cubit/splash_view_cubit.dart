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

    timer4 = Timer(const Duration(milliseconds: 5800), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          GoRouter.of(context).pushReplacement(AppRouter.signInViewPath);
        } else {
          GoRouter.of(context).pushReplacement(AppRouter.homeViewPath);
        }
      });
    });
  }

  void cancelTimers() {
    timer1.cancel();
    timer2.cancel();
    timer3.cancel();
    timer4.cancel();
  }

  @override
  Future<void> close() {
    cancelTimers();
    return super.close();
  }
}
