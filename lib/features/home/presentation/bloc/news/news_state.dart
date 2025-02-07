
part of 'news_bloc.dart';





abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object?> get props => [];
}

class NewsInitial extends NewsState {}

class Loading extends NewsState {}

class LoadedList extends NewsState {
  final  List<NewsEntity> newsEntity;


  const LoadedList({
    required this.newsEntity,

  });

  @override
  List<Object?> get props => [newsEntity,];


}

class Error extends NewsState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}


