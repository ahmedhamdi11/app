import 'package:app/Features/Auth/presentation/views/register_view.dart';
import 'package:app/Features/Auth/presentation/views/sign_in_view.dart';
import 'package:app/Features/attack_detection/data/repos/attack_detection_repo_impl.dart';
import 'package:app/Features/attack_detection/presentation/manager/cubits/attack_detection_cubit/attack_detection_cubit.dart';
import 'package:app/Features/attack_detection/presentation/views/attack_detection_view.dart';
import 'package:app/Features/explore/data/models/threat_awareness_model.dart';
import 'package:app/Features/explore/presentation/views/news_web_view.dart';
import 'package:app/Features/explore/presentation/views/threat_awareness_details_view.dart';
import 'package:app/Features/frauds_detection/data/repos/frauds_detection_repo_impl.dart';
import 'package:app/Features/frauds_detection/presentation/manager/cubits/cubit/frauds_detection_cubit.dart';
import 'package:app/Features/frauds_detection/presentation/views/frauds_detection_view.dart';
import 'package:app/Features/main_page/presentation/manager/cubits/cubit/main_page_cubit.dart';
import 'package:app/Features/main_page/presentation/views/main_page_view.dart';
import 'package:app/Features/malware_detection/data/repos/malware_detection_repo_impl.dart';
import 'package:app/Features/malware_detection/presentation/manager/cubits/malware_detection_cubit/malware_detection_cubit.dart';
import 'package:app/Features/malware_detection/presentation/views/malware_detection_view.dart';
import 'package:app/Features/onBoarding/presentation/manager/page_view_cubit/page_view_cubit.dart';
import 'package:app/Features/onboarding/presentation/views/onboarding_view.dart';
import 'package:app/Features/phishing_email_detection/data/repos/email_detection_repo_impl.dart';
import 'package:app/Features/phishing_email_detection/presentation/manager/cubit/phishing_email_cubit.dart';
import 'package:app/Features/phishing_email_detection/presentation/views/email_detection_view.dart';
import 'package:app/Features/splash/presentation/manager/cubit/splash_view_cubit.dart';
import 'package:app/Features/splash/presentation/views/splash_view.dart';
import 'package:app/core/functions/default_page_transition_builder.dart';
import 'package:app/core/services/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const onBoardingViewPath = '/onBoardingViewPath';
  static const signInViewPath = '/signInViewPath';
  static const registerViewPath = '/registerViewPath';
  static const emailDetectionViewPath = '/emailDetectionViewPath';
  static const fraudsDetectionViewPath = '/fraudsDetectionViewPath';
  static const attackDetectionViewPath = '/attackDetectionViewPath';
  static const malwareDetectionViewPath = '/malwareDetectionViewPath';
  static const mainPageViewPath = '/mainPageViewPath';
  static const threatAwarenessDetailsPath = '/threatAwarenessDetailsPath';
  static const newsWebViewPath = '/newsWebViewPath';

  static GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      // splash view route
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (context) => SplashViewCubit()..changeSplashStates(context),
          child: const SplashView(),
        ),
      ),

      // onboarding route
      GoRoute(
        path: onBoardingViewPath,
        pageBuilder: (context, state) => defaultPageTransitionBuilder(
          key: state.pageKey,
          transitionType: TransitionTypeEnum.fade,
          child: BlocProvider(
            create: (context) => PageViewCubit(),
            child: const OnBoardingView(),
          ),
        ),
      ),

      // sign in view route
      GoRoute(
        path: signInViewPath,
        pageBuilder: (context, state) => defaultPageTransitionBuilder(
          key: state.pageKey,
          transitionType: TransitionTypeEnum.fade,
          duration: const Duration(milliseconds: 650),
          child: const SignInView(),
        ),
      ),

      GoRoute(
        path: registerViewPath,
        pageBuilder: (context, state) => defaultPageTransitionBuilder(
          key: state.pageKey,
          transitionType: TransitionTypeEnum.rtlWithFade,
          child: const RegisterView(),
        ),
      ),

      // home view route
      GoRoute(
        path: mainPageViewPath,
        pageBuilder: (context, state) => defaultPageTransitionBuilder(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => MainPageCubit(),
            child: const MainPageView(),
          ),
          transitionType: TransitionTypeEnum.fade,
          duration: const Duration(milliseconds: 650),
        ),
      ),

      // email detection route
      GoRoute(
        path: emailDetectionViewPath,
        pageBuilder: (context, state) => defaultPageTransitionBuilder(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => PhishingEDCubit(
                emailDetectionRepo: EmailDetectionRepoImpl(ApiServices())),
            child: const EmailDetectionView(),
          ),
        ),
      ),

      // frauds detection route
      GoRoute(
        path: fraudsDetectionViewPath,
        pageBuilder: (context, state) => defaultPageTransitionBuilder(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => FraudsDetectionCubit(
                fraudsDetectionRepo: FraudsDetectionRepoImpl(ApiServices())),
            child: const FraudsDetectionView(),
          ),
        ),
      ),

      // Attack detection route
      GoRoute(
        path: attackDetectionViewPath,
        pageBuilder: (context, state) => defaultPageTransitionBuilder(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => AttackDetectionCubit(
                attackDetectionRepo: AttackDetectionRepoImpl(ApiServices())),
            child: const AttackDetectionView(),
          ),
        ),
      ),

      // Malware detection route
      GoRoute(
        path: malwareDetectionViewPath,
        pageBuilder: (context, state) => defaultPageTransitionBuilder(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => MalwareDetectionCubit(
                malwareDetectionRepo: MalwareDetectionRepoImpl(ApiServices())),
            child: const MalwareDetectionView(),
          ),
        ),
      ),

      // threat awareness details view route
      GoRoute(
        path: threatAwarenessDetailsPath,
        pageBuilder: (context, state) => defaultPageTransitionBuilder(
          key: state.pageKey,
          duration: const Duration(milliseconds: 350),
          child: ThreatAwarenessDetailsView(
            data: state.extra as ThreatAwarenessModel,
          ),
        ),
      ),

      // newsWebViewPath route
      GoRoute(
        path: newsWebViewPath,
        pageBuilder: (context, state) => defaultPageTransitionBuilder(
          key: state.pageKey,
          child: NewsWebview(url: state.extra as String),
        ),
      ),
    ],
  );
}
