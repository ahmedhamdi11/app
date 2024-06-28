part of 'auth_cubit.dart';

class AuthStates {}

class AuthInitialState extends AuthStates {}

class TogglePasswordVisibilityState extends AuthStates {}

/// sign in states
class SignInLoadingState extends AuthStates {}

class SignInSuccessState extends AuthStates {
  final String successMessage;

  SignInSuccessState(this.successMessage);
}

class SignInFailureState extends AuthStates {
  final String errMessage;

  SignInFailureState(this.errMessage);
}

/// register states
class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {
  final String successMessage;

  RegisterSuccessState(this.successMessage);
}

class RegisterFailureState extends AuthStates {
  final String errMessage;

  RegisterFailureState(this.errMessage);
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
