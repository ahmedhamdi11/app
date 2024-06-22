import 'package:app/Features/explore/data/repos/explore_repo_impl.dart';
import 'package:app/Features/explore/presentation/manager/cubits/cyber_news_cubit.dart/cyber_news_cubit.dart';
import 'package:app/Features/explore/presentation/manager/cubits/threat_awareness_cubit/threat_awareness_cubit.dart';
import 'package:app/Features/explore/presentation/views/explore_view.dart';
import 'package:app/Features/account/presentation/views/account_view.dart';
import 'package:app/Features/main_page/data/model/app_views_model.dart';
import 'package:app/Features/test/presentation/views/test_view.dart';
import 'package:app/core/services/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_page_states.dart';

class MainPageCubit extends Cubit<MainPageStates> {
  MainPageCubit() : super(MainPageInitialState());

  int currentView = 0;

  void onViewChanges(viewIndex) {
    currentView = viewIndex;
    emit(CurrentViewChangedState());
  }

  List<AppViewsModel> appViews = [
    AppViewsModel(
      title: 'Explore',
      view: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CyberNewsCubit(
              ExploreRepoImpl(ApiServices()),
            )..getCyberNews(),
          ),
          BlocProvider(
            create: (context) => ThreatAwarenessCubit(
              ExploreRepoImpl(ApiServices()),
            )..getThreatAwarenessData(),
          ),
        ],
        child: const ExploreView(),
      ),
    ),
    const AppViewsModel(title: 'Test Models', view: TestView()),
    const AppViewsModel(title: 'Account', view: AccountView()),
  ];
}
