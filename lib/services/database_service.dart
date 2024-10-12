import 'package:flutter_application_1/services/device_model.dart';
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
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE $_devicesTableName (
            $_devicesIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
            $_devicesNameColumnName TEXT NOT NULL,
            $_devicesSerialNumColumnName TEXT NOT NULL
          )
        ''');
      },
    );
    return database;
  }

  void addDevice( String name, String serialNum) async {
    final db = await database;
    await db.insert(
      _devicesTableName,
      {
        //_devicesIdColumnName: id,
        _devicesNameColumnName: name,
        _devicesSerialNumColumnName: serialNum
      },
    );
  }

    void updateDevice(int id, String name, String serialNum) async {
    final db = await database;
    await db.update(
      _devicesTableName,
      {_devicesNameColumnName: name,
      _devicesSerialNumColumnName: serialNum},
      where: '$_devicesIdColumnName = ?',
      whereArgs: [id]
    );
  }

  void deleteDevice(int id) async {
    final db = await database;
    await db.delete(
      _devicesTableName,
      where: '${_devicesIdColumnName} = ?',
      whereArgs: [id]
    );
  }


  Future<List<Device>> getDevice() async {
    final db = await database;
    final data = await db.query(_devicesTableName);
    List<Device> devices = data
        .map((e) => Device(
            id: e["id"] as int,
            name: e["name"] as String,
            serialNum: e["serialNum"] as String))
        .toList();
    return devices;
  }
}
