import 'package:app/Features/onBoarding/data/data_source/static/onboarding_static_data.dart';
import 'package:app/Features/onBoarding/presentation/manager/page_view_cubit/page_view_cubit.dart';
import 'package:app/Features/onBoarding/presentation/widgets/onboarding_pageview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingPageViewBuilder extends StatelessWidget {
  const OnBoardingPageViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    PageViewCubit cubit = BlocProvider.of<PageViewCubit>(context);
    return PageView.builder(
      onPageChanged: (value) => cubit.onPageChanges(value),
      controller: cubit.controller,
      itemCount: onBoardingData.length,
      itemBuilder: (context, index) => OnBoardingPageViewItem(index: index),
    );
  }
}
