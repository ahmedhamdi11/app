import 'package:app/Features/splash/presentation/manager/cubit/splash_view_cubit.dart';
import 'package:app/Features/splash/presentation/widgets/app_logo.dart';
import 'package:app/Features/splash/presentation/widgets/app_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    SplashViewCubit splashViewCubit = BlocProvider.of<SplashViewCubit>(context);

    return BlocBuilder<SplashViewCubit, SplashViewStates>(
      builder: (context, state) {
        return Stack(
          children: [
            // app logo
            if (splashViewCubit.isRectangle) const AppLogo(),

            // the animated ball with app name
            const AppName(),
          ],
        );
      },
    );
  }
}
