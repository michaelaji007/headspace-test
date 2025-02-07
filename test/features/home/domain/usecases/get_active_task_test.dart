
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:headspace_test/core/error/failures.dart';
import 'package:headspace_test/core/usecases/usecase.dart';
import 'package:headspace_test/features/home/domain/entities/news.dart';
import 'package:headspace_test/features/home/domain/repositories/home_repository.dart';
import 'package:headspace_test/features/home/domain/usecases/get_news.dart';

import 'package:mocktail/mocktail.dart';


class MockTaskRepository extends Mock implements NewsRepository {}

class FakeNoParams extends Fake implements NoParams {}

void main() {
  late GetNews useCase;
  late MockTaskRepository mockTaskRepository;

  setUpAll(() {
    registerFallbackValue(FakeNoParams());
  });

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    useCase = GetNews(mockTaskRepository);
  });

  group('GetActiveTask UseCase', () {
    const testTasks = [
      NewsEntity(author: 'author', content: 'News 1', ),
      NewsEntity(author: 'author2', content: 'News 2', ),

    ];

    test('should return a list of active tasks when repository succeeds', () async {
      when(() => mockTaskRepository.getNews())
          .thenAnswer((_) async => const Right(testTasks));

      final result = await useCase(NoParams());

      verify(() => mockTaskRepository.getNews()).called(1);
      expect(result, const Right(testTasks));
    });

    test('should return Failure when repository fails', () async {
      when(() => mockTaskRepository.getNews())
          .thenAnswer((_) async => Left(ServerFailure(message: "failure")));

      final result = await useCase(NoParams());

      verify(() => mockTaskRepository.getNews()).called(1);
      expect(result, Left(ServerFailure(message: 'failure')));
    });
  });
}
