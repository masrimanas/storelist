import 'dart:developer';

import 'package:sqflite/sqflite.dart'
    show Database, getDatabasesPath, openDatabase;
import 'package:storelist/data/models/store_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  static const String _tableStore = 'store_table';

  Future<Database> get database async {
    return _database ?? await _initDb();
  }

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/storelist.db';

    Database db =
        await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    log('Checked onCreate');
    await db.execute('''
        CREATE TABLE $_tableStore (
          id INTEGER PRIMARY KEY,
          address TEXT,
          area_id TEXT,
          area_name TEXT,
          latitude TEXT,
          longitude TEXT,
          region_id TEXT,
          region_name TEXT,
          store_code TEXT,
          store_id TEXT,
          store_name TEXTT
        );
    ''');

    // await db.execute('''
    //     CREATE TABLE $_tableStore (
    //       id INTEGER PRIMARY KEY,
    //       address TEXT,
    //       area_id INTEGER,
    //       area_name TEXT,
    //       latitude TEXT,
    //       longitude TEXT,
    //       region_id INTEGER,
    //       region_name TEXT,
    //       store_code TEXT,
    //       store_id INTEGER,
    //       store_name TEXT
    //     );
    // ''');
  }

  Future<Map<String, dynamic>?> getStore(int id) async {
    final db = await database;
    final results = await db.query(
      _tableStore,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getStoreList() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db.query(_tableStore);
    return results;
  }

  Future<int> saveStoreList(StoreModel store) async {
    final db = await database;
    return await db.update(_tableStore, store.toJson());
    // return await db.rawInsert(_tableStore, [
    //   store.address,
    //   store.areaId,
    //   store.areaName,
    //   store.latitude,
    //   store.longitude,
    //   store.regionId,
    //   store.regionName,
    //   store.storeCode,
    //   store.storeId,
    //   store.storeName,
    // ]);
  }
}
