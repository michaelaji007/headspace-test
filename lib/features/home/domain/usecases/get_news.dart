

import 'package:dartz/dartz.dart';
import 'package:headspace_test/core/error/failures.dart';
import 'package:headspace_test/core/usecases/usecase.dart';
import 'package:headspace_test/features/home/domain/entities/news.dart';
import 'package:headspace_test/features/home/domain/repositories/home_repository.dart';

class GetNews implements UseCase<List<NewsEntity>, NoParams> {
  final NewsRepository repository;

  GetNews(this.repository);

  @override
  Future<Either<Failure, List<NewsEntity>>> call(NoParams params) async {
    return await repository.getNews();
  }
}