import 'package:app/Features/main_page/presentation/manager/cubits/cubit/main_page_cubit.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/manager/theme_cubit/theme_cubit.dart';
import 'package:app/core/widgets/default_animated_switcher.dart';
import 'package:app/core/widgets/svg_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    MainPageCubit cubit = BlocProvider.of<MainPageCubit>(context);
    final themeCubit = context.read<ThemeCubit>();

    return BlocBuilder<MainPageCubit, MainPageStates>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: DefaultAnimatedSwitcher(
              child: SizedBox(
                key: UniqueKey(),
                width: double.infinity,
                child: BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    return Text(
                      cubit.appViews[cubit.currentView].title,
                      style: GoogleFonts.aBeeZee().copyWith(
                        color: themeCubit.isDarkTheme ? null : kLightTextColor,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          body: cubit.appViews[cubit.currentView].view,
          bottomNavigationBar: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return CurvedNavigationBar(
                backgroundColor: Colors.transparent,
                buttonBackgroundColor:
                    themeCubit.isDarkTheme ? kCardColor : kNavBarColor,
                color: themeCubit.isDarkTheme ? kCardColor : kNavBarColor,
                animationDuration: const Duration(milliseconds: 400),
                onTap: (value) => cubit.onViewChanges(value),
                items: [
                  SvgIconWidget(
                    iconPath: 'assets/icons/explore_icon.svg',
                    iconColor: cubit.currentView == 0
                        ? themeCubit.isDarkTheme
                            ? kPrimaryColor
                            : kLightTextColor
                        : themeCubit.isDarkTheme
                            ? kWhiteColor
                            : kLightTextColor,
                  ),
                  SvgIconWidget(
                    iconPath: 'assets/icons/test_ai_icon.svg',
                    iconColor: cubit.currentView == 1
                        ? themeCubit.isDarkTheme
                            ? kPrimaryColor
                            : kLightTextColor
                        : themeCubit.isDarkTheme
                            ? kWhiteColor
                            : kLightTextColor,
                  ),
                  BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, state) {
                      return SvgIconWidget(
                        iconPath: 'assets/icons/account_icon.svg',
                        iconColor: cubit.currentView == 2
                            ? themeCubit.isDarkTheme
                                ? kPrimaryColor
                                : kLightTextColor
                            : themeCubit.isDarkTheme
                                ? kWhiteColor
                                : kLightTextColor,
                      );
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
