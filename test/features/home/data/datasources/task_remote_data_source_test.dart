import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:headspace_test/core/error/exceptions.dart';
import 'package:headspace_test/features/home/data/datasources/new_remote_data_source.dart';
import 'package:headspace_test/features/home/data/models/new_model.dart';

import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements Dio {}

void main() {
  late NewsRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = NewsRemoteDataSourceImpl(dio: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(() => mockHttpClient.post(any(),
            data: any(named: 'data'), options: any(named: 'options')))
        .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: ''),
              data: json.decode(fixture('news.json')),
              statusCode: 200,
            ));
  }

  void setUpMockHttpClientFailure404() {
    when(() => mockHttpClient.post(any(),
            data: any(named: 'data'), options: any(named: 'options')))
        .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(path: ''),
              statusCode: 404,
              statusMessage: 'Something went wrong',
            ));
  }

  group('getNews', () {
    test('should return a list of news when response is 200', () async {
      setUpMockHttpClientSuccess200();

      final result = await dataSource.getNews();

      expect(result, isA<List<NewsModel>>());
      expect(result.length, 1);
      expect(result[0].author, 'author');

    });

    test('should throw ServerException when response is an error', () async {
      setUpMockHttpClientFailure404();

      expect(() => dataSource.getNews(), throwsA(isA<ServerException>()));
    });
  });
}
