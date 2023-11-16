import 'package:app/Features/explore/data/models/news_model.dart';
import 'package:app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ExploreRepo {
  Future<Either<Failure, List<NewsModel>>> getCyberNews();
}
