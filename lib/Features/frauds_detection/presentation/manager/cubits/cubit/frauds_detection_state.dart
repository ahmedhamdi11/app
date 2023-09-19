part of 'frauds_detection_cubit.dart';

abstract class FraudsDetectionState {}

final class FraudsDetectionInitial extends FraudsDetectionState {}

class DetectFraudsLoadingState extends FraudsDetectionState {}

class DetectFraudsSuccessState extends FraudsDetectionState {
  final PredictionModel prediction;

  DetectFraudsSuccessState(this.prediction);
}

class DetectFraudsFailureState extends FraudsDetectionState {
  final String errMessage;

  DetectFraudsFailureState(this.errMessage);
}

class PickFileSuccessState extends FraudsDetectionState {}

class PickFileFailureState extends FraudsDetectionState {
  final String errMassage;

  PickFileFailureState(this.errMassage);
}

class FileDeleteState extends FraudsDetectionState {}
