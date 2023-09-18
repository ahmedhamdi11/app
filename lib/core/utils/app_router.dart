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
  static GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
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
      )
    ],
  );
}
