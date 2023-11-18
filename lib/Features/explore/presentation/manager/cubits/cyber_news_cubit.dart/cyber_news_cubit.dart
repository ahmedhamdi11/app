import 'package:app/Features/explore/data/models/news_model.dart';
import 'package:app/Features/explore/data/repos/explore_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cyber_news_states.dart';

class CyberNewsCubit extends Cubit<CyberNewsStates> {
  CyberNewsCubit(this.exploreRepo) : super(ExploreInitialState());

  ExploreRepo exploreRepo;

  Future<void> getCyberNews() async {
    emit(GetCyberNewsLoadingState());

    var result = await exploreRepo.getCyberNews();

    result.fold(
      (failure) => emit(GetCyberNewsFailureState(failure.errMessage)),
      (cyberNews) => emit(GetCyberNewsSuccessState(cyberNews)),
    );
  }
}
