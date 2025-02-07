

import 'package:flutter_test/flutter_test.dart';
import 'package:headspace_test/features/home/domain/entities/news.dart';
import 'package:headspace_test/features/home/domain/entities/source.dart';




void main() {
  group('NewsEntity', () {
    test('should support value equality', () {
      final newsEntity1 = NewsEntity(
        author: 'John Doe',
        title: 'Test News',
        description: 'Description',
        url: 'https://example.com',
        urlToImage: 'https://example.com/image.jpg',
        publishedAt: '2024-02-07T12:00:00Z',
        content: 'Content',
        source: SourceEntity(id: '1', name: 'News Source'),
      );

      final newsEntity2 = NewsEntity(
        author: 'John Doe',
        title: 'Test News',
        description: 'Description',
        url: 'https://example.com',
        urlToImage: 'https://example.com/image.jpg',
        publishedAt: '2024-02-07T12:00:00Z',
        content: 'Content',
        source: SourceEntity(id: '1', name: 'News Source'),
      );

      expect(newsEntity1, equals(newsEntity2));
    });
  });
}
