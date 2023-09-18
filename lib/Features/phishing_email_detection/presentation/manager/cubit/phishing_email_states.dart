part of 'phishing_email_cubit.dart';

abstract class PhishingEDStates {}

class PhishingEDInitialState extends PhishingEDStates {}

class CheckEmailLoadingState extends PhishingEDStates {}

class CheckEmailSuccessState extends PhishingEDStates {
  final EmailDetectionModel prediction;

  CheckEmailSuccessState(this.prediction);
}

class CheckEmailFailureState extends PhishingEDStates {
  final String errMessage;

  CheckEmailFailureState(this.errMessage);
}
