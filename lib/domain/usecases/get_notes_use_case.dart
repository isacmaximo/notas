import 'package:notas/domain/models/note.dart';
import 'package:notas/domain/repository/note_repository.dart';

class GetNotesUseCase {
  final NoteRepository _noteRepository;

  GetNotesUseCase(this._noteRepository);

  Future<List<Note>> execute(int page, int pageSize) async {
    return _noteRepository.getNotes(page, pageSize);
  }
}
