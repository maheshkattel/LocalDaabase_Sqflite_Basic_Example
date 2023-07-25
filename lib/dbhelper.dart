import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;
  static final name = 'name';
  static final age = 'age';

  Future<Database> get db async {
    if (_database != null) return await _database!;
    _database = await initializeDatabase();
    return await _database!;
  }

  initializeDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'MaheshDatanaseName.db');
    return await openDatabase(path, version: 1, onCreate: onCreate);
  }

  onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE Test (id INTEGER PRIMARY KEY AUTOINCREMENT, $name TEXT, $age INTEGER)');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database databaseb = await db;
    return await databaseb.insert('Test', row);
  }

  Future<List<Map<String, dynamic>>> query() async {
    Database queryDB = await db;
    return await queryDB.query('Test');
  }

  Future<int> deleteData(int id) async {
    Database deletequery = await db;
    //var res = deletequery.delete('Test', where: "id=2");
    var res = deletequery.delete('Test', where: "id=?", whereArgs: [id]);
    return res;
  }

  Future<List<Map<String, dynamic>>> querySpecific(int age) async {
    Database querySpecific = await db;
    // var res =
    //     await querySpecific.query('Test', where: 'age > ?', whereArgs: [age]);
    var res =
        await querySpecific.rawQuery('SELECT * FROM Test WHERE age > ?', [age]);
    return res;
  }

  Future<int> update(int id) async {
    Database update = await db;
    var res = update.update("Test", {'name': 'KAttel Mahesh', 'age': 30},
        where: "id = ?", whereArgs: [id]);
    return res;
  }
}
