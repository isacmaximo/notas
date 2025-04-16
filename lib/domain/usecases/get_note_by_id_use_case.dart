import 'package:notas/domain/models/note.dart';
import 'package:notas/domain/repository/note_repository.dart';

class GetNoteByIdUseCase {
  final NoteRepository _noteRepository;

  GetNoteByIdUseCase(this._noteRepository);

  Future<Note> execute(int id) async {
    return _noteRepository.getNoteById(id);
  }
}
