import 'package:app/Features/onBoarding/data/data_source/static/onboarding_static_data.dart';
import 'package:app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'page_view_state.dart';

class PageViewCubit extends Cubit<PageViewStates> {
  PageViewCubit() : super(PageViewInitialState());

  int currentPage = 0;
  PageController controller = PageController();

  void onPageChanges(int page) {
    currentPage = page;
    emit(OnPageChangesState());
  }

  onboardingButtonPressed(BuildContext context) {
    if (currentPage < onBoardingData.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 450),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      // getIt<SharedPreferences>().setBool('onboarding', true);
      GoRouter.of(context).pushReplacement(AppRouter.signInViewPath);
    }
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
