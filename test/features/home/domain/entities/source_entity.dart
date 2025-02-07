



import 'package:flutter_test/flutter_test.dart';
import 'package:headspace_test/features/home/domain/entities/source.dart';


void main() {
  group('SourceEntity', () {
    test('should support value equality', () {
      final sourceEntity1 = SourceEntity(id: '1', name: 'News Source');
      final sourceEntity2 = SourceEntity(id: '1', name: 'News Source');

      expect(sourceEntity1, equals(sourceEntity2));
    });

    test('should handle nullable values correctly', () {
      final sourceEntity = SourceEntity();

      expect(sourceEntity.id, isNull);
      expect(sourceEntity.name, isNull);
    });
  });
}
