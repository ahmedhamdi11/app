import 'package:app/Features/Auth/data/repos/auth_repo.dart';
import 'package:app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, String>> signInUser({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(
        'Welcome back! ${FirebaseAuth.instance.currentUser?.displayName ?? ''}',
      );
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      } else if (e is FirebaseAuthException) {
        if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
          return left(Failure('invalid email or password'));
        } else {
          return left(Failure(e.message!));
        }
      } else {
        return left(Failure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, UserCredential>> singInWithGoogle() async {
    try {
      // begin interactive sign in process
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      // return failure message when no account selected or the gUser is null
      if (gUser == null) {
        return left(AuthFailure('Sign in failed'));
      }

      // obtain auth details from request
      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      // create new credential for the user
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // sign in user in firebase with credential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return right(userCredential);
    } catch (e) {
      return left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> signOutUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      return right('Signed out');
    } catch (e) {
      return left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right('Account created, signIn now!');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      } else if (e is FirebaseAuthException) {
        if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
          return left(Failure('invalid email or password'));
        } else {
          return left(Failure(e.message!));
        }
      } else {
        return left(Failure(e.toString()));
      }
    }
  }
}
