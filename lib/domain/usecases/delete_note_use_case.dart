import 'package:notas/domain/repository/note_repository.dart';

class DeleteNoteUseCase {
  final NoteRepository _noteRepository;

  DeleteNoteUseCase(this._noteRepository);

  Future<void> execute(int id) async {
    return _noteRepository.deleteNote(id);
  }
}
