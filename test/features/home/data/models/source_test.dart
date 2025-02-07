



import 'package:flutter_test/flutter_test.dart';
import 'package:headspace_test/features/home/data/models/new_model.dart';
import 'package:headspace_test/features/home/data/models/source_model.dart';
import 'package:uuid/uuid.dart';

void main() {

  group('Source', () {
    const sourceJson = {'id': '1', 'name': 'News Source'};

    test('should create a valid Source from JSON', () {
      final source = Source.fromJson(sourceJson);

      expect(source.id, '1');
      expect(source.name, 'News Source');
    });

    test('should generate a UUID if id is null', () {
      final source = Source.fromJson({'name': 'Generated Source'});

      expect(source.id, isNotNull);
      expect(Uuid.isValidUUID(fromString: source.id!), isTrue);
      expect(source.name, 'Generated Source');
    });

    test('should convert Source to JSON correctly', () {
      final source = Source.fromJson(sourceJson);
      final jsonResult = source.toJson();

      expect(jsonResult, sourceJson);
    });
  });
}