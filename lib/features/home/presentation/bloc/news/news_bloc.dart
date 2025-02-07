import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:headspace_test/core/error/failures.dart';
import 'package:headspace_test/core/usecases/usecase.dart';
import 'package:headspace_test/features/home/domain/entities/news.dart';
import 'package:headspace_test/features/home/domain/usecases/get_news.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNews getNews;

  NewsBloc({
    required this.getNews,
  }) : super(NewsInitial()) {
    on<GetNewsEvent>(_handleGetNews);
  }

  Future<void> _handleGetNews(
      GetNewsEvent event, Emitter<NewsState> emit) async {
    emit(Loading());

    final result = await getNews(NoParams());
    emit(result.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (news) {
        return LoadedList(newsEntity: news);
      },
    ));
  }

  String _mapFailureToMessage(Failure failure) {
    return switch (failure) {
      ServerFailure() => failure.message,
      CacheFailure() => failure.message,
      _ => 'Unexpected error',
    };
  }
}
