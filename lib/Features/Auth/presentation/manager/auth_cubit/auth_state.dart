part of 'auth_cubit.dart';

class AuthStates {}

class AuthInitialState extends AuthStates {}

class SignInUserLoadingState extends AuthStates {}

class SignInUserSuccessState extends AuthStates {
  final String successMessage;

  SignInUserSuccessState(this.successMessage);
}

class SignInUserFailureState extends AuthStates {
  final String errMessage;

  SignInUserFailureState(this.errMessage);
}
