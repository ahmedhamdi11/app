import 'package:app/Features/splash/presentation/manager/cubit/splash_view_cubit.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AppName extends StatelessWidget {
  const AppName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ThemeCubit>();
    SplashViewCubit splashViewCubit = BlocProvider.of<SplashViewCubit>(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return BlocBuilder<SplashViewCubit, SplashViewStates>(
      builder: (context, state) {
        return AnimatedAlign(
          alignment: splashViewCubit.isInCenter
              ? const Alignment(0, 0.2)
              : Alignment.topCenter,
          curve: Curves.elasticOut,
          duration: const Duration(milliseconds: 3100),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1700),
            curve: Curves.fastLinearToSlowEaseIn,
            width: splashViewCubit.isExpanded
                ? w
                : splashViewCubit.isRectangle
                    ? 165
                    : 20,
            height: splashViewCubit.isExpanded
                ? h
                : splashViewCubit.isRectangle
                    ? 50
                    : 20,
            decoration: BoxDecoration(
              color: splashViewCubit.isExpanded
                  ? cubit.isDarkTheme
                      ? kBackgroundColor
                      : kLightBackgroundColor
                  : cubit.isDarkTheme
                      ? kSecondaryColor.withOpacity(0.8)
                      : kLightTextColor,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: splashViewCubit.isRectangle
                ? Center(
                    child: Animate(
                      onComplete: (controller) =>
                          Future.delayed(const Duration(milliseconds: 1800))
                              .then(
                        (value) => controller.reverse(),
                      ),
                      effects: const [
                        FadeEffect(duration: Duration(milliseconds: 850)),
                      ],
                      child: Text(
                        'Secure Shield',
                        style: GoogleFonts.bitter(
                          fontSize: 17,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : const SizedBox(),
          ),
        );
      },
    );
  }
}
