import 'dart:convert';

import 'package:littlewords/beans/dto/word.dto.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  static const String _dbName = 'littlewords.db';
  static const int _dbVersion = 3; // Numéro de version du schéma de la base de données

  static Database? _db;

  static initDb() async {
    final String dbPath = await getDatabasesPath();
    final String path = dbPath + _dbName;
    final Database database = await openDatabase(path,
        version: _dbVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
    _db = database;
  }

  static const String tableName = "words";

  static const String createTable = '''
  CREATE TABLE IF NOT EXISTS $tableName (
    uid INTEGER primary key NOT NULL,
    author VARCHAR NOT NULL,
    content VARCHAR NOT NULL,
    latitude REAL NULL,
    longitude REAL NULL
  )
  ''';

  static const String dropTable = '''
    drop table if not exists $tableName
  ''';

  static  _onCreate(Database db, int version) {
    db.execute(createTable);
  }

  static _onUpgrade(Database db, int oldVersion, int newVersion) {
    db.execute(dropTable);

    _onCreate(db, newVersion);
  }
  // Inserer une ligne dans la table.
  static void insert(WordDTO word){
    final Map<String, dynamic> wordAsMap = word.toJson();
    _db!.insert(tableName, wordAsMap);
  }

  // Recupére toutes les lignes de la table.
  static Future<List<WordDTO>> findAll() async{
    final List<Map<String, Object?>> resultSet = await _db!.query(tableName);
    if(resultSet.isEmpty){
      return [];
    }

    // Convertir chaque ligne de resultSet en wordDTO.
    final List<WordDTO> words = [];
    for (var map in resultSet) {
      var wordDTO = WordDTO.fromJson(map);
      words.add(wordDTO);
    }
    return words;
  }
}