part of 'cyber_news_cubit.dart';

class CyberNewsStates {}

class ExploreInitialState extends CyberNewsStates {}

class GetCyberNewsLoadingState extends CyberNewsStates {}

class GetCyberNewsSuccessState extends CyberNewsStates {
  final List<NewsModel> cyberNews;

  GetCyberNewsSuccessState(this.cyberNews);
}

class GetCyberNewsFailureState extends CyberNewsStates {
  final String errMessage;

  GetCyberNewsFailureState(this.errMessage);
}
