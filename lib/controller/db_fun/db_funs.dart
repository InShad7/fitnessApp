import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

late Database db;

Future<void> initDataBase() async {
  db = await _openDatabase();
}

Future<Database> _openDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'fit.db');

  return await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) {
      db.execute(
        'CREATE TABLE fit (id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, water INTEGER, food INTEGER, workout INTEGER, sleep INTEGER)',
      );
    },
  );
}


