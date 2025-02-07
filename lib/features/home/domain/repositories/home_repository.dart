

import 'package:dartz/dartz.dart';
import 'package:headspace_test/features/home/domain/entities/news.dart';
import '../../../../core/error/failures.dart';
abstract class NewsRepository{

  Future<Either<Failure, List<NewsEntity>>> getNews();


}

