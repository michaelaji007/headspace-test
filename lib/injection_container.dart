import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:headspace_test/features/home/domain/usecases/get_news.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/db/database.dart';
import 'core/network/network_info.dart';
import 'features/home/data/datasources/new_remote_data_source.dart';
import 'features/home/data/datasources/news_local_data_source.dart';
import 'features/home/data/repositories/news_repository_impl.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/presentation/bloc/news/news_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Bloc
  getIt.registerFactory(
    () => NewsBloc(
      getNews: getIt(),
    ),
  );

  // Use cases

  getIt.registerLazySingleton(() => GetNews(getIt()));

  // Repository

  getIt.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      networkInfo: getIt(),
      remoteDataSource: getIt(),
      offlineDataSource: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImpl(dio: getIt()),
  );

  getIt.registerLazySingleton<NewsOfflineDataSource>(
    () => NewsOfflineDataSource(dbHelper: getIt()),
  );

  //! Core

  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  //! External
  getIt.registerLazySingleton(() => DatabaseHelper.instance);
  final interConnection = InternetConnectionChecker.instance;
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => interConnection);
}
