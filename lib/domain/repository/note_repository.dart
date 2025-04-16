import 'package:notas/domain/models/note.dart';

abstract class NoteRepository {
  Future<void> createNote(Note note);
  Future<void> deleteNote(int id);
  Future<void> updateNote(Note note);
  Future<List<Note>> getNotes(int page, int pageSize);
  Future<Note> getNoteById(int id);
  Future<int> getTotalPages(int pageSize);
}
