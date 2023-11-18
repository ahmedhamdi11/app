part of 'explore_cubit.dart';

class ExploreStates {}

class ExploreInitialState extends ExploreStates {}

// get cyber news states
class GetCyberNewsLoadingState extends ExploreStates {}

class GetCyberNewsSuccessState extends ExploreStates {
  final List<NewsModel> cyberNews;

  GetCyberNewsSuccessState(this.cyberNews);
}

class GetCyberNewsFailureState extends ExploreStates {
  final String errMessage;

  GetCyberNewsFailureState(this.errMessage);
}

// get threat awareness data states
class GetThreatAwarenessLoadingState extends ExploreStates {}

class GetThreatAwarenessSuccessState extends ExploreStates {
  final List<ThreatAwarenessModel> threatAwarenessData;

  GetThreatAwarenessSuccessState(this.threatAwarenessData);
}

class GetThreatAwarenessFailureState extends ExploreStates {
  final String errMessage;

  GetThreatAwarenessFailureState(this.errMessage);
}
