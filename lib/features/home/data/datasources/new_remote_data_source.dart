import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:headspace_test/core/error/exceptions.dart';
import 'package:headspace_test/features/home/data/models/new_model.dart';

const API_KEY = "505c7a1eea7247018b191bdbf770360d";
const url = "https://newsapi.org/v2/top-headlines";

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> getNews();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final Dio dio;

  NewsRemoteDataSourceImpl({
    required this.dio,
  });

  Map<String, String> _headers() => {
        'Content-Type': 'application/json',
      };

  T _handleResponse<T>(Response response, T Function(dynamic) fromJson) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return fromJson(response.data);
    } else {
      throw ServerException(
        message: response.statusMessage ?? "Unknown error",
      );
    }
  }

  @override
  Future<List<NewsModel>> getNews() async {
    try {
      final response = await dio.get(
        url,
        queryParameters: {
          "country": "us",
          "category": "business",
          "apiKey": API_KEY
        },
        options: Options(headers: _headers()),
      );

      // log(jsonEncode(response.data).toString());

      return _handleResponse<List<NewsModel>>(
        response,
        (data) => (data["articles"] as List).map((e) => NewsModel.fromJson(e)).toList(),
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
