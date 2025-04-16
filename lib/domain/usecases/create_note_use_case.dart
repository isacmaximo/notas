import 'package:notas/domain/models/note.dart';
import 'package:notas/domain/repository/note_repository.dart';

class CreateNoteUseCase {
  final NoteRepository _noteRepository;

  CreateNoteUseCase(this._noteRepository);

  Future<void> execute(Note note) async {
    return _noteRepository.createNote(note);
  }
}
