import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

abstract class Db {
  static Future<sql.Database> connection() async {
    WidgetsFlutterBinding.ensureInitialized();

    final dbPath = await sql.getDatabasesPath();

    return sql.openDatabase(
      path.join(dbPath, 'crypto_app.db'),
      onCreate: (db, version) {
        return db.execute('''
      CREATE TABLE favorite_cryptos (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        symbol TEXT NOT NULL,
        image TEXT,
        is_favorite INTEGER NOT NULL DEFAULT 0,
        created_at INTEGER NOT NULL
      )
    ''');
      },
      version: 1,
    );
  }
}
