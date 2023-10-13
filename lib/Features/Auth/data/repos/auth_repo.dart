import 'package:app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> signInUser({
    required String email,
    required String password,
  });
}
