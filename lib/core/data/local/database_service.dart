import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _database;
  static const String _tableConfigsName = "configs";
  static final DatabaseService instance = DatabaseService._internal();

  DatabaseService._internal();

  String  get tableConfigsName => _tableConfigsName;

  Future <Database> get database async {
    _database ??= await _getDatabase();
    return _database!;
  }

  Future<Database> _getDatabase() async {
    final String path = join(await getDatabasesPath(), 'vpn_db.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }


  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE IF NOT EXISTS $tableConfigsName (id INTEGER PRIMARY KEY, text TEXT, url TEXT, remark TEXT, address TEXT, selected INTEGER)',
    );
  }

}



final databaseServiceProvider = Provider<DatabaseService>((ref) {
  return DatabaseService.instance;
});