import 'package:app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> signInUser({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserCredential>> singInWithGoogle();

  Future<Either<Failure, String>> signOutUser(BuildContext context);
}
