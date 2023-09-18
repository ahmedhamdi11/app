import 'package:app/Features/phishing_email_detection/data/models/email_detection_model.dart';
import 'package:app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class EmailDetectionRepo {
  Future<Either<Failure, EmailDetectionModel>> checkEmail(
      {required String email});
}
