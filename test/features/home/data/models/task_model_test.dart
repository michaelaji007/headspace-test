import 'package:flutter_test/flutter_test.dart';
import 'package:headspace_test/features/home/data/models/new_model.dart';

void main() {
  group('NewsModel', () {
    const newsJson = {
      'author': 'John Doe',
      'title': 'Breaking News',
      'description': 'This is a news description.',
      'url': 'https://example.com/news',
      'urlToImage': 'https://example.com/image.jpg',
      'publishedAt': '2024-02-07T12:00:00Z',
      'content': 'This is the content of the news.',
      'source': {'id': '1', 'name': 'News Source'},
    };

    test('should create a valid NewsModel from JSON', () {
      final newsModel = NewsModel.fromJson(newsJson);

      expect(newsModel.author, 'John Doe');
      expect(newsModel.title, 'Breaking News');
      expect(newsModel.description, 'This is a news description.');
      expect(newsModel.url, 'https://example.com/news');
      expect(newsModel.urlToImage, 'https://example.com/image.jpg');
      expect(newsModel.publishedAt, '2024-02-07T12:00:00Z');
      expect(newsModel.content, 'This is the content of the news.');
      expect(newsModel.source?.name, 'News Source');
    });

    test('should convert NewsModel to JSON correctly', () {
      final newsModel = NewsModel.fromJson(newsJson);
      final jsonResult = newsModel.toJson();

      expect(jsonResult, newsJson);
    });
  });
}

