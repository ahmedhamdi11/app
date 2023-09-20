import 'dart:io';

import 'package:app/core/models/prediction_model.dart';
import 'package:app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AttackDetectionRepo {
  Future<Either<Failure, PredictionModel>> detectAttack({required File file});
}
