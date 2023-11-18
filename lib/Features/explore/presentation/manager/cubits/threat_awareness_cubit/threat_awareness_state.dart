part of 'threat_awareness_cubit.dart';

class ThreatAwarenessStates {}

class ThreatAwarenessInitialState extends ThreatAwarenessStates {}

class GetThreatAwarenessLoadingState extends ThreatAwarenessStates {}

class GetThreatAwarenessSuccessState extends ThreatAwarenessStates {
  final List<ThreatAwarenessModel> threatAwarenessData;

  GetThreatAwarenessSuccessState(this.threatAwarenessData);
}

class GetThreatAwarenessFailureState extends ThreatAwarenessStates {
  final String errMessage;

  GetThreatAwarenessFailureState(this.errMessage);
}
