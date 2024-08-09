import 'dart:typed_data';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';

import 'package:timeless_words/model/word_model.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  static Database? _database;

  factory DBHelper() => _instance;

  DBHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String dbPath = join(await getDatabasesPath(), 'timeless_words.db');

    // Check if the database exists
    bool dbExists = await databaseExists(dbPath);

    if (!dbExists) {
      // If the database doesn't exist, copy it from assets
      print("Creating a new copy from assets");

      try {
        await Directory(dirname(dbPath)).create(recursive: true);

        // Copy from assets
        ByteData data = await rootBundle.load('assets/timeless_words.db');
        List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

        // Write the copied data to the database file
        await File(dbPath).writeAsBytes(bytes, flush: true);
      } catch (e) {
        print("Error copying database: $e");
      }
    } else {
      print("Opening existing database");
    }

    // Open the database
    return await openDatabase(dbPath, version: 1);
  }

  Future<List<Word>> getWords() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('word');

    return List.generate(maps.length, (i) {
      return Word.fromMap(maps[i]);
    });
  }

  Future<void> insertWord(Word word) async {
    final db = await database;
    await db.insert('word', word.toMap());
  }

  Future<void> deleteWord(int id) async {
    final db = await database;
    await db.delete('word', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Word>> getBookmarkedWords() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('word', where: 'adding = ?', whereArgs: [1]);

    return List.generate(maps.length, (i) {
      return Word.fromMap(maps[i]);
    });
  }

  Future<void> updateWord(Word word) async {
    final db = await database;
    await db.update('word', word.toMap(), where: 'id = ?', whereArgs: [word.id]);
  }
}
