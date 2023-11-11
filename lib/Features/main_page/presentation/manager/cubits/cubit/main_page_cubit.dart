import 'package:app/Features/explore/presentation/views/explore_view.dart';
import 'package:app/Features/home/presentation/views/home_view.dart';
import 'package:app/Features/account/presentation/views/account_view.dart';
import 'package:app/Features/main_page/data/model/app_views_model.dart';
import 'package:app/Features/test/presentation/views/test_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_page_states.dart';

class MainPageCubit extends Cubit<MainPageStates> {
  MainPageCubit() : super(MainPageInitialState());

  int currentView = 0;

  void onViewChanges(viewIndex) {
    currentView = viewIndex;
    emit(CurrentViewChangedState());
  }

  List<AppViewsModel> appViews = const [
    AppViewsModel(title: 'Secure Shield', view: HomeView()),
    AppViewsModel(title: 'Explore', view: ExploreView()),
    AppViewsModel(title: 'Test Models', view: TestView()),
    AppViewsModel(title: 'Account', view: AccountView()),
  ];
}
