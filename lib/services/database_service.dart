import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  final String _devicesTableName = "devices";
  final String _devicesIdColumnName = "id";
  final String _devicesNameColumnName = "name";
  final String _devicesSerialNumColumnName = "serialNum";

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "master_db.db");
    final database  = await openDatabase(
      databasePath,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE $_devicesTableName (
            $_devicesIdColumnName INTEGER PRIMARY KEY,
            $_devicesNameColumnName TEXT NOT NULL,
            $_devicesSerialNumColumnName TEXT NOT NULL
          )
        ''');
      },
    );
    return database;
  }

}