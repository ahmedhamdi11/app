part of 'attack_detection_cubit.dart';

abstract class AttackDetectionStates {}

final class AttackDetectionInitial extends AttackDetectionStates {}

class DetectAttackLoadingState extends AttackDetectionStates {}

class DetectAttackSuccessState extends AttackDetectionStates {
  final PredictionModel prediction;

  DetectAttackSuccessState(this.prediction);
}

class DetectAttackFailureState extends AttackDetectionStates {
  final String errMessage;

  DetectAttackFailureState(this.errMessage);
}

class PickFileSuccessState extends AttackDetectionStates {}

class PickFileFailureState extends AttackDetectionStates {
  final String errMassage;

  PickFileFailureState(this.errMassage);
}

class FileDeleteState extends AttackDetectionStates {}
