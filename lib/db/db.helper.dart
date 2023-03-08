import 'package:sqflite/sqflite.dart';

class DbHelper{
  static const String _dbName = 'littlewords.db';
  static const int _dbVersion = 1; // Numéro de version du schéma de la base de données

  static Database? _db;

  static initDb() async {
    final String dbPath = await getDatabasesPath();
    final String path = dbPath + _dbName;
    final Database database = await openDatabase(path,
        version: _dbVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
    _db = database;
  }

  static const String createTable = '''
  Create table if not exists user (
    uid integer primary key not null,
    username varchar not null
  )
  ''';

  static const String dropTable = '''
    drop table if not exists user
  ''';

  static  _onCreate(Database db, int version) {
    db.execute(createTable);
  }

  static _onUpgrade(Database db, int oldVersion, int newVersion) {
    db.execute(dropTable);

    _onCreate(db, newVersion);
  }
}