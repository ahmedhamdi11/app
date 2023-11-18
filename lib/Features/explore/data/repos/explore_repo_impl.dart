import 'package:app/Features/explore/data/models/news_model.dart';
import 'package:app/Features/explore/data/models/threat_awareness_model.dart';
import 'package:app/Features/explore/data/repos/explore_repo.dart';
import 'package:app/core/constants/constants.dart';
import 'package:app/core/errors/failures.dart';
import 'package:app/core/services/api_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ExploreRepoImpl implements ExploreRepo {
  final ApiServices apiServices;
  ExploreRepoImpl(this.apiServices);

  // get cyber news implementation
  @override
  Future<Either<Failure, List<NewsModel>>> getCyberNews() async {
    const apiKey = 'd6915a64ebda4592aba0fd80f2cd88dd';
    try {
      // send get request
      Response response = await apiServices.get(
        url: '$kNewsBaseUrl/v2/everything?q=cyber security',
        headers: {
          'X-Api-Key': apiKey,
        },
      );

      // add the response data to my news list
      List<NewsModel> cyberNews = [];

      for (var item in response.data['articles']) {
        cyberNews.add(NewsModel.fromJson(item));
      }

      return right(cyberNews);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ThreatAwarenessModel>>>
      getTreatAwarenessData() async {
    try {
      // send get request
      Response response = await apiServices.get(
        url: kBaseUrl + kThreatAwarenessEndPoint,
      );

      // add the response data to my list
      List<ThreatAwarenessModel> threatAwarenessData = [];

      for (var item in response.data['data']) {
        threatAwarenessData.add(ThreatAwarenessModel.fromJson(item));
      }

      return right(threatAwarenessData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
