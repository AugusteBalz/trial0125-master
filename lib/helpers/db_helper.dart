import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {





  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'user_mood_database1.db'),
        onCreate: (db, version) async{
          return await db.execute(
              'CREATE TABLE user_mood_database(id TEXT PRIMARY KEY, dateTime TEXT, primaryMood TEXT, secondaryMood TEXT, strength INTEGER, color TEXT)');
        }, version: 1);
  }

  static Future<void> insert(String table, List<Map<String, dynamic>> data) async {
    final db = await DBHelper.database();


    //TODO: is it a good way to store items as list of maps? Is there a better way?
    for(Map<String, dynamic> map in data){
      db.insert(
        table,
        map,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }



  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }
}
