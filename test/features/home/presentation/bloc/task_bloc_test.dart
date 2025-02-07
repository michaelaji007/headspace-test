



import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:headspace_test/core/error/failures.dart';
import 'package:headspace_test/core/usecases/usecase.dart';
import 'package:headspace_test/features/home/domain/entities/news.dart';
import 'package:headspace_test/features/home/domain/usecases/get_news.dart';
import 'package:headspace_test/features/home/presentation/bloc/news/news_bloc.dart';



import 'package:mocktail/mocktail.dart';



class MockGetNews extends Mock implements GetNews {}

class MockNoParams extends Mock implements NoParams {}





void main() {

  late GetNews mockGetNews;
  late NewsBloc newsBloc;

  setUp(() {

    mockGetNews = MockGetNews();
    registerFallbackValue(MockNoParams());


    newsBloc = NewsBloc(

      getNews: mockGetNews,

    );
  });
  tearDown(() {
    newsBloc.close();
  });


  const initialLoadedState = LoadedList(newsEntity: []);

  group('GetActiveTaskEvent', () {
    const task1 = NewsEntity(
      author: 'author',
      content: 'content 1',

    );
    const task2 = NewsEntity(
      author: 'author2',
      content: 'content 2',

    );
    final List<NewsEntity> news = [task1, task2];

    test('initial state should be TaskInitial', () {
      expect(newsBloc.state, NewsInitial());
    });

    blocTest<NewsBloc, NewsState>(
      'emits [Loading, LoadedList] when GetNewsEvent succeeds',
      build: () {
        when(() => mockGetNews(any()))
            .thenAnswer((_) async => Right(news));
        return newsBloc;
      },
      act: (bloc) => bloc.add(GetNewsEvent()),
      expect: () => [
        Loading(),
        LoadedList(newsEntity: news),
      ],
    );

    blocTest<NewsBloc, NewsState>(
      'emits [Loading, Error] when GetNewsEvent fails',
      build: () {
        when(() => mockGetNews(any()))
            .thenAnswer((_) async => Left(ServerFailure(message: 'Failed to news')));
        return newsBloc;
      },
      act: (bloc) => bloc.add(GetNewsEvent()),
      expect: () => [
        Loading(),
        const Error(message: 'Failed to load tasks'),
      ],
    );
  });



}