import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/user.dart'; // Sesuaikan dengan path model User Anda

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static late Database _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    // if (_database !== null) {
    //   return _database;
    // }

    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    String path = await getDatabasesPath();
    return openDatabase(join(path, 'my_database.db'),
        onCreate: _onCreate, version: 1);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY,
        name TEXT,
        email TEXT,
        imagePath TEXT
      )
    ''');
  }

  Future<int> insertUser(User user) async {
    final db = await database;
    return db.insert('users', user.toMap());
  }

  Future<List<User>> getAllUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        name: maps[i]['name'],
        email: maps[i]['email'],
        imagePath: maps[i]['imagePath'],
      );
    });
  }

  // Memperbarui kolom imagePath untuk pengguna dengan ID tertentu di tabel 'users'
  Future<void> updateUserImage(int userId, String imagePath) async {
    final db = await database;
    await db.update(
      'users',
      {'imagePath': imagePath},
      where: 'id = ?',
      whereArgs: [userId],
    );
  }
}
