import '../../../../core/db/database.dart';
import '../../../../core/error/exceptions.dart';
import '../models/new_model.dart';


abstract class NewsLocalDataSource {

  Future<List<NewsModel>>? getCacheNews();
  Future<void> cacheNews( List <NewsModel> newsToCache);
}

class NewsOfflineDataSource implements NewsLocalDataSource {
  final  DatabaseHelper dbHelper;
  NewsOfflineDataSource({required this.dbHelper});

  @override
  Future<List<NewsModel>> getCacheNews() async{
    try {
        final cachedNews = await dbHelper.getCachedNews();
        if (cachedNews.isEmpty) {
          throw ServerException(message: 'No internet connection and no cached data');
        }
        return cachedNews;
    } catch (e) {
      throw CacheException(message: e.toString());
  }
  }

  @override
  Future<void> cacheNews(List<NewsModel> newsToCache) async{
    try {
     await dbHelper.insertNews(newsToCache);

    } catch (e) {
    throw CacheException(message: e.toString());
  }
  }



}
