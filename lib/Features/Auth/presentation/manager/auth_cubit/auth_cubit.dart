import 'package:app/Features/Auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this.authRepo) : super(AuthInitialState());
  AuthRepo authRepo;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String email;
  late String password;

  bool isHiddenPassword = true;

  void togglePasswordVisibility() {
    isHiddenPassword = !isHiddenPassword;
    emit(TogglePasswordVisibilityState());
  }

  Future<void> signInUser() async {
    if (formKey.currentState!.validate()) {
      emit(SignInUserLoadingState());
      var result = await authRepo.signInUser(email: email, password: password);

      result.fold(
        (failure) => emit(SignInUserFailureState(failure.errMessage)),
        (succussMessage) => emit(SignInUserSuccessState(succussMessage)),
      );
    }
  }
}
