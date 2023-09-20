import 'package:app/Features/attack_detection/data/repos/attack_detection_repo_impl.dart';
import 'package:app/Features/attack_detection/presentation/manager/cubits/attack_detection_cubit/attack_detection_cubit.dart';
import 'package:app/Features/attack_detection/presentation/views/attack_detection_view.dart';
import 'package:app/Features/frauds_detection/data/repos/frauds_detection_repo_impl.dart';
import 'package:app/Features/frauds_detection/presentation/manager/cubits/cubit/frauds_detection_cubit.dart';
import 'package:app/Features/frauds_detection/presentation/views/frauds_detection_view.dart';
import 'package:app/Features/home/presentation/views/home_view.dart';
import 'package:app/Features/phishing_email_detection/data/repos/email_detection_repo_impl.dart';
import 'package:app/Features/phishing_email_detection/presentation/manager/cubit/phishing_email_cubit.dart';
import 'package:app/Features/phishing_email_detection/presentation/views/email_detection_view.dart';
import 'package:app/core/functions/default_page_transition_builder.dart';
import 'package:app/core/services/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const emailDetectionViewPath = '/emailDetectionViewPath';
  static const fraudsDetectionViewPath = '/fraudsDetectionViewPath';
  static const attackDetectionViewPath = '/attackDetectionViewPath';

  static GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      // hom route
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
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
    ],
  );
}
