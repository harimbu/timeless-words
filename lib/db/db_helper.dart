import 'dart:async';
import 'dart:io' as io;
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timeless_words/model/word_model.dart';

class DBHelper {
  static Database? _db;
  final String _dbName = 'timeless_words.db';

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    bool dbExists = await io.File(path).exists();

    if (!dbExists) {
      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", _dbName));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await io.File(path).writeAsBytes(bytes, flush: true);
    }

    var theDb = await openDatabase(path, version: 1);
    return theDb;
  }

  Future<List<Map<String, dynamic>>> getAllWords() async {
    final dbClient = await db;
    return await dbClient.query('word');
  }

  Future<Map<String, dynamic>?> getWordById(int id) async {
    final dbClient = await db;
    final results = await dbClient.query('word', where: 'id = ?', whereArgs: [id]);
    return results.isNotEmpty ? results.first : null;
  }

  Future<void> insertWord(Map<String, dynamic> word) async {
    final dbClient = await db;
    await dbClient.insert('word', word, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteWord(int id) async {
    final dbClient = await db;
    await dbClient.delete('word', where: 'id = ?', whereArgs: [id]);
  }
}

final db = DBHelper();
