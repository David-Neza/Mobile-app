

import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/response.dart';
import '../models/user_models.dart';

class DatabaseHelper {

 DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documensDirectory = await getApplicationDocumentsDirectory();
    String path = join(documensDirectory.path, 'clds.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user(
        id INTEGER PRIMARY KEY,
        name TEXT,
        password TEXT
      )
    ''');
  
  }

   // insert into user tbl
  Future<int> addUser(User user) async {
    Database db = await instance.database;
    var io = await db.insert('user', user.toMap());
    return io;
  }
   // read user tbl
  Future<Response<User>> getUser() async {
    Database db = await instance.database;
    var res = await db.query("user", where: "id = ?", whereArgs: [1]);
    return Response(
        object: res.isNotEmpty ? User.fromMap(res.first) : null,
        message: 'success',
        error: false);
  }

  // drop table
  drop() async {
    Database db = await instance.database;
    await db.execute("DROP TABLE IF EXISTS user");
  }

}