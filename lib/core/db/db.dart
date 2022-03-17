import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sukabaca_clone/core/db/book.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  static String _tableName = 'books';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'book_db.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName (
               id INTEGER PRIMARY KEY,
               title TEXT, description TEXT
             )''',
        );
      },
      version: 1,
    );

    return db;
  }

  Future<void> insertBook(Book book) async {
    final Database db = await database;
    await db.insert(_tableName, book.toMap());
  }

  Future<List<Book>> getBooks() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);

    return results.map((res) => Book.fromMap(res)).toList();
  }

  Future<Book> getBookById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    return results.map((res) => Book.fromMap(res)).first;
  }

  Future<void> updateBook(Book book) async {
    final db = await database;

    await db.update(
      _tableName,
      book.toMap(),
      where: 'id = ?',
      whereArgs: [book.id],
    );
  }

  Future<void> deleteBook(int id) async {
    final db = await database;

    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
