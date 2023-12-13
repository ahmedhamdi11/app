import 'package:app/Features/onBoarding/data/data_source/static/onboarding_static_data.dart';
import 'package:app/Features/onBoarding/presentation/manager/page_view_cubit/page_view_cubit.dart';
import 'package:app/Features/onBoarding/presentation/widgets/custom_page_indicator.dart';
import 'package:app/Features/onBoarding/presentation/widgets/onboarding_pageview_builder.dart';
import 'package:app/core/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    PageViewCubit cubit = BlocProvider.of<PageViewCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // page indicator
            BlocBuilder<PageViewCubit, PageViewStates>(
              builder: (context, state) {
                return CustomPageIndicator(
                  length: onBoardingData.length,
                  currentPage: cubit.currentPage,
                );
              },
            ),

            // page view
            const Expanded(child: OnBoardingPageViewBuilder()),

            // the onboarding button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: BlocBuilder<PageViewCubit, PageViewStates>(
                builder: (context, state) {
                  return DefaultButton(
                    onPressed: () => cubit.onboardingButtonPressed(context),
                    btnText: cubit.currentPage == onBoardingData.length - 1
                        ? 'Get Started'
                        : 'Next',
                  );
                },
              ),
            ),

            const SizedBox(height: 22.0),
          ],
        ),
      ),
    );
  }
}
