import 'package:notas/domain/models/note.dart';
import 'package:notas/domain/repository/note_repository.dart';

class UpdateNoteUseCase {
  final NoteRepository _noteRepository;

  UpdateNoteUseCase(this._noteRepository);

  Future<void> execute(Note note) async {
    return _noteRepository.updateNote(note);
  }
}
