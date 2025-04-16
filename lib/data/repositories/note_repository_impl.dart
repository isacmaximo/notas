import 'package:notas/domain/repository/note_repository.dart';

import '../../domain/models/note.dart';
import '../datasources/local/note_local_datasource.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDataSource dataSource;

  NoteRepositoryImpl(this.dataSource);

  @override
  Future<void> createNote(Note note) async {
    await dataSource.createNote(note.toMap());
  }

  @override
  Future<void> deleteNote(int id) async {
    await dataSource.deleteNote(id);
  }

  @override
  Future<void> updateNote(Note note) async {
    await dataSource.updateNote(note.toMap());
  }

  @override
  Future<List<Note>> getNotes(int page, int pageSize) async {
    final notes = await dataSource.getNotes(page, pageSize);
    return notes.map((note) => Note.fromMap(note)).toList();
  }

  @override
  Future<Note> getNoteById(int id) async {
    final note = await dataSource.getNoteById(id);
    return Note.fromMap(note);
  }

  @override
  Future<int> getTotalPages(int pageSize) async {
    return dataSource.getTotalPages(pageSize);
  }
}
