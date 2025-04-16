import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class NoteLocalDataSource {
  Future<Database> _openDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'notes.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE notes('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'title TEXT, '
          'description TEXT, '
          'createdAt TEXT, '
          'hour TEXT'
          ')',
        );
      },
    );
  }

  Future<int> getTotalCount(Database db) async {
    final result = await db.rawQuery('SELECT COUNT(*) as total FROM notes');
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<int> getTotalPages(int pageSize) async {
    final db = await _openDatabase();
    int totalItens = await getTotalCount(db);
    return (totalItens / pageSize).ceil();
  }

  Future<void> createNote(Map<String, dynamic> note) async {
    final db = await _openDatabase();
    await db.insert('notes', note);
  }

  Future<void> deleteNote(int id) async {
    final db = await _openDatabase();
    await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateNote(Map<String, dynamic> note) async {
    final db = await _openDatabase();
    await db.update('notes', note, where: 'id = ?', whereArgs: [note['id']]);
  }

  Future<List<Map<String, dynamic>>> getNotes(int page, int pageSize) async {
    final db = await _openDatabase();
    final offset = (page - 1) * pageSize;
    return db.query('notes', limit: pageSize, offset: offset);
  }

  Future<Map<String, dynamic>> getNoteById(int id) async {
    final db = await _openDatabase();
    final result = await db.query('notes', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? result.first : {};
  }
}
