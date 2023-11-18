import 'dart:io';

import 'package:app/Features/attack_detection/data/repos/attack_detection_repo.dart';
import 'package:app/core/models/prediction_model.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/errors/failures.dart';
import 'package:app/core/services/api_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;

class AttackDetectionRepoImpl implements AttackDetectionRepo {
  final ApiServices apiServices;

  AttackDetectionRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, PredictionModel>> detectAttack(
      {required File file}) async {
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file.path,
        filename: p.basename(file.path),
      ),
    });

    try {
      Response response = await apiServices.post(
        url: kBaseUrl + kAttackDetectionEndPoint,
        data: formData,
      );
      PredictionModel prediction =
          PredictionModel.fromJson(response.data['data']);

      return right(prediction);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
