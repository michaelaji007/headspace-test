import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:headspace_test/core/network/network_info.dart';
import 'package:headspace_test/features/home/data/datasources/new_remote_data_source.dart';
import 'package:headspace_test/features/home/data/models/new_model.dart';
import 'package:headspace_test/features/home/domain/repositories/home_repository.dart';


import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../datasources/news_local_data_source.dart';



class NewsRepositoryImpl extends NewsRepository {
final NewsRemoteDataSource remoteDataSource;
final NewsOfflineDataSource offlineDataSource;
final NetworkInfo networkInfo;

NewsRepositoryImpl({
  required this.remoteDataSource,
  required this.offlineDataSource,
  required this.networkInfo,
});



  @override
  Future<Either<Failure, List<NewsModel>>> getNews() async {
    try {
      if (await networkInfo.isConnected) {
        try {
          final remoteTasks = await remoteDataSource.getNews();
          await offlineDataSource.cacheNews(remoteTasks);
          return Right(remoteTasks);
        } on ServerException {
          final offlineTasks = await offlineDataSource.getCacheNews();
          return Right(offlineTasks);
        }
      } else {
        final offlineTasks = await offlineDataSource.getCacheNews();
        return Right(offlineTasks);
      }
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}