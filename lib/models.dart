import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutDBHelper/screens/models/FlutterDBHelperModelClass.dart';


class User {
  int? id;
  String name;
  String login;
  String password;

  User({this.id, required this.name, required this.login, required this.password});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'login': login, 'password': password};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(id: map['id'], name: map['name'],login: map['login'], password: map['password'],);
  }
}




class Todo {
  int? id;
  String description;
  bool isCompleted;
  int userId;

  Todo({this.id, required this.description, required this.isCompleted, required this.userId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0,
      'userId': userId,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      description: map['description'],
      isCompleted: map['isCompleted'] == 1,
      userId: map['userId'],
    );
  }
}


class DatabaseHelper {
  static Database _database;
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'todo_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY,
        name TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE todos(
        id INTEGER PRIMARY KEY,
        description TEXT,
        isCompleted INTEGER,
        userId INTEGER,
        FOREIGN KEY(userId) REFERENCES users(id)
      )
    ''');
  }

  Future<int> insertUser(User user) async {
    final db = await database;
    return await db.insert('users', user.toMap());
  }

  Future<int> insertTodo(Todo todo) async {
    final db = await database;
    return await db.insert('todos', todo.toMap());
  }

  Future<List<Todo>> getTodosByUserId(int userId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'todos',
      where: 'userId = ?',
      whereArgs: [userId],
    );
    return List.generate(maps.length, (i) {
      return Todo.fromMap(maps[i]);
    });
  }
}