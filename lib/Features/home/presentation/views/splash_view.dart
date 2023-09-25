import 'dart:async';

import 'package:app/Features/home/presentation/manager/cubits/cubit/splash_view_cubit.dart';
import 'package:app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    SplashViewCubit splashViewCubit = BlocProvider.of<SplashViewCubit>(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocBuilder<SplashViewCubit, SplashViewStates>(
        builder: (context, state) {
          return AnimatedAlign(
            alignment: splashViewCubit.isInCenter
                ? Alignment.center
                : Alignment.topCenter,
            curve: Curves.elasticOut,
            duration: const Duration(milliseconds: 3100),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              width: splashViewCubit.isExpanded
                  ? w
                  : splashViewCubit.isRectangle
                      ? 160
                      : 20,
              height: splashViewCubit.isExpanded
                  ? h
                  : splashViewCubit.isRectangle
                      ? 60
                      : 20,
              decoration: BoxDecoration(
                color: splashViewCubit.isExpanded
                    ? Colors.transparent
                    : kPrimaryColor,
                borderRadius: BorderRadius.circular(22.0),
              ),
              child: splashViewCubit.isRectangle
                  ? Center(
                      child: Animate(
                        onComplete: (controller) =>
                            Future.delayed(const Duration(milliseconds: 1500))
                                .then((value) => controller.reverse()),
                        effects: const [
                          FadeEffect(duration: Duration(milliseconds: 750)),
                        ],
                        child: Text(
                          'The App',
                          style: GoogleFonts.lobster(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
          );
        },
      ),
    );
  }
}
