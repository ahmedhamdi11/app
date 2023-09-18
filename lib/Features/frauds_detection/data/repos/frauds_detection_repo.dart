import 'dart:io';

import 'package:app/core/models/prediction_model.dart';
import 'package:app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class FraudsDetectionRepo {
  Future<Either<Failure, PredictionModel>> detectFrauds({required File file});
}
