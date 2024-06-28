part of 'auth_cubit.dart';

class AuthStates {}

class AuthInitialState extends AuthStates {}

class TogglePasswordVisibilityState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthSuccessState extends AuthStates {
  final String successMessage;

  AuthSuccessState(this.successMessage);
}

class AuthFailureState extends AuthStates {
  final String errMessage;

  AuthFailureState(this.errMessage);
}

// sign in with google states
class SignInWithGoogleLoadingState extends AuthStates {}

class SignInWithGoogleSuccessState extends AuthStates {
  final UserCredential userCredential;

  SignInWithGoogleSuccessState(this.userCredential);
}

class SignInWithGoogleFailureState extends AuthStates {
  final String errMessage;

  SignInWithGoogleFailureState(this.errMessage);
}

// sign out states
class SignOutUserLoadingState extends AuthStates {}

class SignOutUserFailureState extends AuthStates {
  final String errMessage;

  SignOutUserFailureState(this.errMessage);
}

class SignOutUserSuccessState extends AuthStates {
  final String successMessage;

  SignOutUserSuccessState(this.successMessage);
}
