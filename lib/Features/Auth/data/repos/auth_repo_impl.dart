import 'package:app/Features/Auth/data/repos/auth_repo.dart';
import 'package:app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, String>> signInUser(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return right('Welcom back!');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      } else if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          return left(Failure('No user found for this email.'));
        } else if (e.code == 'wrong-password') {
          return left(Failure('Wrong password provided for that user.'));
        } else {
          return left(Failure(e.toString()));
        }
      } else {
        return left(Failure(e.toString()));
      }
    }
  }
}
