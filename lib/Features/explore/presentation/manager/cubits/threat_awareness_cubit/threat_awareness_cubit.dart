import 'package:app/Features/explore/data/models/threat_awareness_model.dart';
import 'package:app/Features/explore/data/repos/explore_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'threat_awareness_state.dart';

class ThreatAwarenessCubit extends Cubit<ThreatAwarenessStates> {
  ThreatAwarenessCubit(this.exploreRepo) : super(ThreatAwarenessInitialState());

  ExploreRepo exploreRepo;

  Future<void> getThreatAwarenessData() async {
    emit(GetThreatAwarenessLoadingState());

    var result = await exploreRepo.getTreatAwarenessData();

    result.fold(
      (failure) => emit(GetThreatAwarenessFailureState(failure.errMessage)),
      (threatAwarenessData) =>
          emit(GetThreatAwarenessSuccessState(threatAwarenessData)),
    );
  }
}
