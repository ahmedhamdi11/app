import 'package:app/Features/Auth/data/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this.authRepo) : super(AuthInitialState());
  AuthRepo authRepo;

  late GlobalKey<FormState> registerFormKey;
  late GlobalKey<FormState> signInFormKey;

  late String signInEmail;
  late String signInPassword;

  late String registerEmail;
  late String registerPassword;
  late String fullName;

  bool isHiddenPassword = true;

  void togglePasswordVisibility() {
    isHiddenPassword = !isHiddenPassword;
    emit(TogglePasswordVisibilityState());
  }

  Future<void> signInUser() async {
    if (signInFormKey.currentState!.validate()) {
      emit(SignInLoadingState());

      var result = await authRepo.signInUser(
        email: signInEmail,
        password: signInPassword,
      );

      result.fold(
        (failure) => emit(SignInFailureState(failure.errMessage)),
        (succussMessage) => emit(SignInSuccessState(succussMessage)),
      );
    }
  }

  Future<void> registerUser() async {
    if (registerFormKey.currentState!.validate()) {
      emit(RegisterLoadingState());

      var result = await authRepo.registerUser(
        email: registerEmail,
        password: registerPassword,
      );

      result.fold(
        (failure) => emit(RegisterFailureState(failure.errMessage)),
        (succussMessage) {
          FirebaseAuth.instance.currentUser?.updateDisplayName(fullName);
          emit(RegisterSuccessState(succussMessage));
        },
      );
    }
  }

  Future<void> singInWithGoogle() async {
    emit(SignInWithGoogleLoadingState());
    var result = await authRepo.singInWithGoogle();

    result.fold(
      (failure) => emit(SignInWithGoogleFailureState(failure.errMessage)),
      (userCredential) => emit(SignInWithGoogleSuccessState(userCredential)),
    );
  }

  Future<void> singOutUser(BuildContext context) async {
    emit(SignOutUserLoadingState());

    var result = await authRepo.signOutUser(context);

    result.fold(
      (failure) => emit(SignOutUserFailureState(failure.errMessage)),
      (success) => emit(SignOutUserSuccessState(success)),
    );
  }
}
