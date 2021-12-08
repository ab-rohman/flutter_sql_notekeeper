import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_sql_notekeeper/models/note.dart';

// class DatabaseHelper {
//   // static late DatabaseHelper _databaseHelper; //singleton DatabaseHelper
//   // static late Database _database;
//   DatabaseHelper.privateConstructor();

//   DatabaseHelper();
//   static final DatabaseHelper instance = DatabaseHelper.privateConstructor();

//   static Database? _database;
//   Future<Database> get database async => _database ??= await _initDatabase();

//   Future<Database> _initDatabase() async {
//     Directory documentDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentDirectory.path, 'note.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//     );
//   }

//   Future _onCreate(Database db, int version) async {
//     await db.execute(
//         '''CRATE TABLE note_table(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, date TEXT, priority TEXT)''');
//   }

//   Future<List<Note>> getNotes() async {
//     Database db = await instance.database;
//     var note_table = await db.query('note_tabel', orderBy: 'title');
//     List<Note> noteList = note_table.isNotEmpty
//         ? note_table.map((e) => Note.fromMap(e)).toList()
//         : [];
//     return noteList;
//   }

//   Future<int> add(Note note) async {
//     Database db = await instance.database;
//     return await db.insert('note_table', note.toMap());
//   }

//   // String noteTable = 'note_table';
//   // String colID = 'id';
//   // String colTitle = 'title';
//   // String colDesc = 'Description';
//   // String colPriority = 'priority';
//   // String colDate = 'date';

//   // DatabaseHelper._createInstance();
//   // factory DatabaseHelper() {
//   //   if (_databaseHelper == null) {
//   //     _databaseHelper = DatabaseHelper._createInstance();
//   //   }
//   //   return _databaseHelper;
//   // }

//   // Future<Database> get database async {
//   //   if (_database == null) {
//   //     _database = await initializeDatabase();
//   //   }
//   //   return _database;
//   // }

//   // Future<Database> initializeDatabase() async {
//   //   //get the directory path for both IOS and Android
//   //   Directory directory = await getApplicationDocumentsDirectory();
//   //   String path = directory.path + 'notes.db';
//   //   //open/create the database at given path
//   //   var notesDatabase =
//   //       await openDatabase(path, version: 1, onCreate: _createDB);
//   //   return notesDatabase;
//   // }

//   // void _createDB(Database db, int newVersion) async {
//   //   await db.execute(
//   //       'CREATE TABLE $noteTable($colID INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT,$colDesc TEXT, $colPriority INTEGER, $colDate TEXT)');
//   // }

//   // Future<List<Map<String, dynamic>>> getNoteMapList() async {
//   //   Database db = await this.database;
//   //   // var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
//   //   var result = await db.query(noteTable, orderBy: '$colPriority ASC');
//   //   return result;
//   // }

//   // Future<int> insertNote(Note note) async {
//   //   Database db = await this.database;
//   //   var result = await db.insert(noteTable, note.toMap());
//   //   return result;
//   // }

//   // Future<int> updateNote(Note note) async {
//   //   var db = await this.database;
//   //   var result = await db.update(noteTable, note.toMap(),
//   //       where: '$colID = ?', whereArgs: [note.id]);
//   //   return result;
//   // }

//   // Future<int> deleteNote(int id) async {
//   //   var db = await this.database;
//   //   int result =
//   //       await db.rawDelete('DELETE FROM $noteTable WHERE $colID = $id');
//   //   return result;
//   // }

//   // Future<int?> getCount() async {

//   //   Database db = await this.database;
//   //   List<Map<String, dynamic>> x =
//   //       await db.rawQuery('SELECT COUNT (*) FROM $noteTable');
//   //   int? result = Sqflite.firstIntValue(x);
//   //   return result;
//   // }
// }

class DatabaseHelper {
  Future<Database> initDatabase() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, "note.db"),
      onCreate: (database, version) async {
        await database.execute("""
          CREATE TABLE note_table(id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          description TEXT,
          date TEXT,
          priority TEXT)
          """);
      },
      version: 1,
    );
  }

  Future<bool> insertData(Note note) async {
    final Database db = await initDatabase();
    db.insert("note_table", note.toMap());
    return true;
  }

  Future<List<Note>> getData() async {
    final Database db = await initDatabase();
    final List<Map<String, dynamic>> datas = await db.query("note_table");
    return datas.map((e) => Note.fromMap(e)).toList();
  }
}
