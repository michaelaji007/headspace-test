




import 'package:headspace_test/features/home/data/models/new_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'news.db');

    return openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE news(
           id TEXT PRIMARY KEY,
            author TEXT,
            title TEXT,
            description TEXT,
            url TEXT,
            urlToImage TEXT,
            publishedAt TEXT,
            content TEXT,
             source_id TEXT,
            source_name TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertNews(List<NewsModel> newsList) async {
    final db = await instance.database;
    final batch = db.batch();
    await db.delete('news');

    for (var news in newsList) {
      batch.insert('news', news.toMap());
    }

    await batch.commit();
  }

  Future<List<NewsModel>> getCachedNews() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'news',
      orderBy: 'publishedAt DESC',
    );
    return maps.map((e) => NewsModel.fromJson(e)).toList();
  }
}