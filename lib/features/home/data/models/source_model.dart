




import 'package:headspace_test/features/home/domain/entities/source.dart';
import 'package:uuid/uuid.dart';

class Source extends SourceEntity {
  const Source({super.id, super.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] ?? Uuid().v4(),
      name: json['name'] ?? 'Unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      id: map['source_id'],
      name: map['source_name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'source_id': id,
      'source_name': name,
    };
  }


}