import 'package:app/core/models/prediction_model.dart';
import 'package:app/Features/phishing_email_detection/data/repos/phishing_email_repo.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/errors/failures.dart';
import 'package:app/core/services/api_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class EmailDetectionRepoImpl implements EmailDetectionRepo {
  final ApiServices apiServices;

  EmailDetectionRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, PredictionModel>> checkEmail(
      {required String email}) async {
    try {
      Response response = await apiServices.post(
        url: kBaseUrl + kPhishingEmailEndPoint,
        data: {'email': email},
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
