import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:headspace_test/core/error/exceptions.dart';
import 'package:headspace_test/core/error/failures.dart';
import 'package:headspace_test/core/network/network_info.dart';
import 'package:headspace_test/features/home/data/datasources/new_remote_data_source.dart';
import 'package:headspace_test/features/home/data/datasources/news_local_data_source.dart';
import 'package:headspace_test/features/home/data/models/new_model.dart';
import 'package:headspace_test/features/home/data/repositories/news_repository_impl.dart';


import 'package:mocktail/mocktail.dart';

class MockRemoteDataSource extends Mock implements NewsRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}
class MockLocalDataSource extends Mock implements NewsOfflineDataSource {}


void main() {
  late NewsRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late MockLocalDataSource mockLocalDataSource;


  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
  mockLocalDataSource = MockLocalDataSource();
    repository = NewsRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
      offlineDataSource: mockLocalDataSource,
    );
  });





  group('NewsRepositoryImpl', () {
    const newsModelList = [NewsModel(author: 'John Doe', title: 'Test News')];

    test('should return remote data when online', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.getNews()).thenAnswer((_) async => newsModelList);
      when(() => mockLocalDataSource.cacheNews(any())).thenAnswer((_) async {});

      final result = await repository.getNews();

      expect(result, Right(newsModelList));
      verify(() => mockRemoteDataSource.getNews()).called(1);
    });

    test('should return cached data when server fails', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.getNews()).thenThrow(ServerException(message: ""));
      when(() => mockLocalDataSource.getCacheNews()).thenAnswer((_) async => newsModelList);

      final result = await repository.getNews();

      expect(result, Right(newsModelList));
      verify(() => mockLocalDataSource.getCacheNews()).called(1);
    });

    test('should return cache failure when no cache is available', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      when(() => mockLocalDataSource.getCacheNews()).thenThrow(CacheException(message: 'No cache available'));

      final result = await repository.getNews();

      expect(result, Left(CacheFailure(message: 'No cache available')));
    });
  });
}
