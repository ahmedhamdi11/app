import 'dart:io';

import 'package:app/Features/frauds_detection/data/repos/frauds_detection_repo.dart';
import 'package:app/core/models/prediction_model.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/errors/failures.dart';
import 'package:app/core/services/api_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FraudsDetectionRepoImpl implements FraudsDetectionRepo {
  final ApiServices apiServices;

  FraudsDetectionRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, PredictionModel>> detectFrauds(
      {required File file}) async {
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last),
    });
    try {
      Response response = await apiServices.post(
        endPoint: kFraudsDetectionEndPoint,
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
