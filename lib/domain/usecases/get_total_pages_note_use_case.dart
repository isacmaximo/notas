import 'package:notas/domain/repository/note_repository.dart';

class GetTotalPagesNoteUseCase {
  final NoteRepository _noteRepository;

  GetTotalPagesNoteUseCase(this._noteRepository);

  Future<int> execute(int pageSize) async {
    return _noteRepository.getTotalPages(pageSize);
  }
}
